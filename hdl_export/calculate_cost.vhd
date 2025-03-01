library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity calculate_cost is
    port (
        button   : in  std_logic;
        data_in  : in  std_logic_vector(5 downto 0);
        data_out : out std_logic_vector(6 downto 0);
        error    : out std_logic
    );
end entity calculate_cost;

architecture rtl of calculate_cost is
    signal shift_reg : std_logic_vector(6 downto 0);
begin
    process(button)
    begin
        if rising_edge(button) then
            if (to_integer(unsigned(data_in)) <= 50) then
                shift_reg <= data_in & '0';  -- Shift left and insert new data at the end
                error <= '0';  -- Reset the error signal
            else
                shift_reg <= (others => '0');  -- Set shift_reg to 0 when data_in > 50
                error <= '1';  -- Set the error signal to 1
            end if;
        end if;
    end process;

    data_out <= shift_reg;
end architecture rtl;