library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity introduce_money is
    port (
        cost        : in  std_logic_vector(6 downto 0);
        button      : in  std_logic;
        addr        : in  std_logic_vector(2 downto 0);
        suma_data   : out std_logic_vector(6 downto 0);
        suma_ceruta : out std_logic_vector(6 downto 0);
        ok          : out std_logic --cand am ajuns la suma ceruta, trecem la acordarea restului
    );
end entity introduce_money;

architecture rtl of introduce_money is
    signal suma_ceruta_int : integer := 0;
    signal introdus_semnal : integer := 0;
    
begin
    suma_ceruta_int <= to_integer(unsigned(cost));
    suma_ceruta <= cost;
    process(button)
        variable introdus : integer := introdus_semnal;
    begin
        if rising_edge(button) then
            case addr is
                when "000" =>
                    introdus := introdus + 1;
                when "001" =>
                    introdus := introdus + 2;
                when "010" =>
                    introdus := introdus + 5;
                when "011" =>
                    introdus := introdus + 10;
                when "100" =>
                    introdus := introdus + 20;
                when "101" =>
                    introdus := introdus + 50;
                when others =>
                    null;
            end case;
            
            if introdus >= suma_ceruta_int then
                suma_data <= std_logic_vector(to_unsigned(introdus, 7));
                ok <= '1';
            else
            	 ok <= '0';
            end if;
            
            introdus_semnal <= introdus;
        end if;
        
        suma_data <= std_logic_vector(to_unsigned(introdus, 7));
    end process;

end architecture rtl;
