library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned;
--use ieee.std_logic_arith.all;

entity memory_money is
    port (
        button    : in  std_logic;
        mode      : in  std_logic;-- mode e 0-> admin
        					    -- mode e 1-> user
        we        : in  std_logic;
        addr      : in  std_logic_vector(2 downto 0);
        unu       : in  std_logic_vector(6 downto 0);
        doi       : in  std_logic_vector(6 downto 0);
        cinci     : in  std_logic_vector(6 downto 0);
        zece      : in  std_logic_vector(6 downto 0);
        dzeci     : in  std_logic_vector(6 downto 0);
        czeci     : in  std_logic_vector(6 downto 0);
        din       : in  std_logic_vector(7 downto 0);
        ok        : in  std_logic;
        unu_out   : out std_logic_vector(7 downto 0);
        doi_out   : out std_logic_vector(7 downto 0);
        cinci_out : out std_logic_vector(7 downto 0);
        zece_out  : out std_logic_vector(7 downto 0);
        dzeci_out : out std_logic_vector(7 downto 0);
        czeci_out : out std_logic_vector(7 downto 0);
        dout      : out std_logic_vector(7 downto 0);
        error     : out std_logic
    );
end entity memory_money;

architecture rtl of memory_money is
    type memory_array is array (0 to 5) of std_logic_vector(7 downto 0);
    signal memory : memory_array := (others => "00000000");
begin

    process(button,ok)
    variable flag : std_logic;
    begin
        if rising_edge(button) then
                if mode = '0' then
                    if we = '1' then
                        memory(to_integer(unsigned(addr))) <= din;
                    else
                        dout <= memory(to_integer(unsigned(addr)));
                     end if;
                elsif ok = '1' then
                if unsigned(memory(0)) >= unsigned(unu) then
                    memory(0) <= std_logic_vector(unsigned(memory(0)) - unsigned(unu));
                else
                    flag := '1';
                end if;
                if unsigned(memory(1)) >= unsigned(doi) and flag /='1' then
                    memory(1) <= std_logic_vector(unsigned(memory(1)) - unsigned(doi));
                 else
                    flag := '1';
                end if;
                if unsigned(memory(2)) >= unsigned(cinci) and flag /='1' then
                    memory(2) <= std_logic_vector(unsigned(memory(2)) - unsigned(cinci));
                else
                    flag := '1';
                end if;
                if unsigned(memory(3)) >= unsigned(zece) and flag /='1'  then
                    memory(3) <= std_logic_vector(unsigned(memory(3)) - unsigned(zece));        
                else
                    flag := '1';
                end if;
                if unsigned(memory(4)) >= unsigned(dzeci) and flag /='1' then
                    memory(4) <= std_logic_vector(unsigned(memory(4)) - unsigned(dzeci));
                else
                    flag := '1';
                end if; 
                if unsigned(memory(5)) >= unsigned(czeci) and flag /='1' then
                    memory(5) <= std_logic_vector(unsigned(memory(5)) - unsigned(czeci));
                else
                    flag := '1';
                end if;
            end if;
            if flag ='1' then
            	error <= '1';
            else
            	error <= '0';
            end if;
            unu_out <= memory(0);
            doi_out <= memory(1);
            cinci_out <= memory(2);
            zece_out <= memory(3);
            dzeci_out <= memory(4);
            czeci_out <= memory(5);
        end if;
    end process;

end rtl;
