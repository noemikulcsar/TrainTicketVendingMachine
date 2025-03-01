library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity number_splitter is
  port (
    num_in : in std_logic_vector(6 downto 0);
    units_out : out std_logic_vector(3 downto 0);
    tens_out : out std_logic_vector(3 downto 0);
    hundreds_out : out std_logic_vector(3 downto 0)
  );
end entity number_splitter;

architecture behavior of number_splitter is
  signal num : integer;
begin
  num <= to_integer(unsigned(num_in));
  units_out <= std_logic_vector(to_unsigned(num mod 10, 4));
  tens_out <= std_logic_vector(to_unsigned(num / 10 mod 10, 4));
  hundreds_out <= std_logic_vector(to_unsigned(num / 100 mod 10, 4));
end architecture behavior;
