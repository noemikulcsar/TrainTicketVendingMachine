library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_tickets is
    port (
    button           : in std_logic;
    numar_bilete 	  : in std_logic_vector(6 downto 0);
    ok 			  : in std_logic;
    numar_bilete_out : out std_logic_vector(6 downto 0);
    error            : out std_logic
    );
end entity memory_tickets;

architecture Behavioral of memory_tickets is
    signal nr_bilete : unsigned(6 downto 0);
begin
    process (button,ok)
    begin
    if rising_edge(button) then
        if ok = '1' then
        	if unsigned(numar_bilete) > 0 then
            nr_bilete <= unsigned(numar_bilete) - 1;
            error <= '0';
          else
           error <= '1';
          end if;
        else
        	  nr_bilete <= unsigned(numar_bilete);
        end if;
     end if;
    end process;

    numar_bilete_out <= std_logic_vector(nr_bilete);
end architecture Behavioral;
