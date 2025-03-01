LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
ENTITY calculate_rest IS
  PORT (
    suma_data   : in std_logic_vector(6 downto 0);
    suma_ceruta : in std_logic_vector(6 downto 0);
    ok          : in std_logic;
    rest        : out std_logic_vector(6 downto 0);
    ok2         : out std_logic;
    error       : out std_logic
    );
END calculate_rest;

ARCHITECTURE TypeArchitecture OF calculate_rest IS
  signal rest_int        : integer;
  signal suma_data_int   : integer;
  signal suma_ceruta_int : integer;
BEGIN
  ok2 <= ok;
  process(ok)
  begin
  if ok ='1' then
    error           <= '0';
    rest <= suma_data-suma_ceruta;
   else
	error <= '1';
   end if;
  end process;
  
END TypeArchitecture;