LIBRARY ieee;
USE ieee.std_logic_1164.all;
					  
ENTITY segment_7 IS
							
  PORT (
     val           : IN  std_logic_vector(3 DOWNTO 0);
  	a_b_c_d_e_f_g : OUT std_logic_vector(6 downTO 0)
    );
END segment_7;
--   a
--f     b
--   g
--e     c
--   d
--
--
ARCHITECTURE TypeArchitecture OF segment_7 IS

BEGIN
		a_b_c_d_e_f_g <= "0000001" when val = x"0" else
				       "1001111" when val = x"1" else
				       "0010010" when val = x"2" else
				       "0000110" when val = x"3" else
				       "1001100" when val = x"4" else
				       "0100100" when val = x"5" else
				       "0100000" when val = x"6" else
				       "0001111" when val = x"7" else
				       "0000000" when val = x"8" else
				       "0000100" when val = x"9" else
				       "0001000" when val = x"A" else
				       "1100000" when val = x"b" else
				       "1110010" when val = x"c" else
				       "1000010" when val = x"d" else
				       "0110000" when val = x"E" else
				       "0111000" when val = x"F" ;	-- toate segmentele stinse
				       		

END TypeArchitecture;