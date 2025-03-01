LIBRARY ieee;
USE ieee.std_logic_1164.all;

use ieee.numeric_std.all;

ENTITY procesare_rest IS
  PORT (
  	rest   : in std_logic_vector(6 downto 0);
  	ok     : in std_logic;
  	unu    : out std_logic_vector(6 downto 0);
  	doi    : out std_logic_vector(6 downto 0);
  	cinci  : out std_logic_vector(6 downto 0);
  	zece   : out std_logic_vector(6 downto 0);
  	dzeci  : out std_logic_vector(6 downto 0);
  	czeci  : out std_logic_vector(6 downto 0);
  	ok2    : out std_logic
    );
END procesare_rest;
            
ARCHITECTURE TypeArchitecture OF procesare_rest IS
	signal left : natural :=0 ;
BEGIN
	ok2 <= ok;
     left <= to_integer(unsigned(rest));

	process(ok,left)
     variable ramas : natural;
     variable unu_int : natural := 0;
     variable doi_int : natural := 0;
     variable cinci_int : natural := 0;
     variable zece_int : natural := 0;
     variable dzeci_int : natural := 0;
     variable czeci_int : natural := 0;
	begin
		if ok = '1' then
		ramas := left;
		czeci_int:=ramas/50;
		czeci<=std_logic_vector(to_unsigned(czeci_int,7));
		ramas:=ramas-czeci_int*50;
		dzeci_int:=ramas/20;
		dzeci<=std_logic_vector(to_unsigned(dzeci_int,7));
		ramas:=ramas-dzeci_int*20;
		zece_int:=ramas/10;
		zece<=std_logic_vector(to_unsigned(zece_int,7));
		ramas:=ramas-zece_int*10;
		cinci_int:=ramas/5;
		cinci<=std_logic_vector(to_unsigned(cinci_int,7));
		ramas:=ramas-cinci_int*5;
		doi_int:=ramas/2;
		doi<=std_logic_vector(to_unsigned(doi_int,7));
		ramas:=ramas-doi_int*2;
		unu_int:=ramas;
		unu<=std_logic_vector(to_unsigned(unu_int,7));
		end if;
	end process;
	
END TypeArchitecture;