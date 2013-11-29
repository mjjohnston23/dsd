	

-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_row_config
--
-- Copyright (C) 2011
-- Version 1.0
-- Author: Johnston and Colomb
-- Date: 7 Ocotber 2011

library ieee;
use ieee.std_logic_1164.all;

package define_ASP_2 is
	type ASP_array is array(0 to 3) of std_logic_vector(2 downto 0);
end package define_ASP_2;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.define_ASP_2.all;

entity g14_row_config is
	port(ASP_r_i, ASP_c_i : in ASP_array;
		horiz, vertic, l_r_diag, r_l_diag : out bit);
end g14_row_config;

architecture a of g14_row_config is
signal horiz_temp, vertic_temp, l_r_diag_temp, r_l_diag_temp : bit;
signal ASP_r_i_0_temp, ASP_r_i_1_temp, ASP_c_i_0_temp, ASP_c_i_1_temp : std_logic_vector(2 downto 0);
begin 





ASP_r_i_0_temp <= ASP_r_i(0);
ASP_c_i_0_temp <= ASP_c_i(0);
ASP_r_i_1_temp <= ASP_r_i(1);
ASP_c_i_1_temp <= ASP_c_i(1);


horiz_temp <= '1' when ((ASP_r_i_0_temp = ASP_r_i_1_temp)and(ASP_c_i_0_temp = ASP_c_i_1_temp - "001")) or (ASP_r_i_1_temp = "111") else
				'0';

vertic_temp <= '1' when (ASP_r_i_0_temp  = ASP_r_i_1_temp - "001")and(ASP_c_i_0_temp = ASP_c_i_1_temp) else
				'0';
				
l_r_diag_temp <= '1' when (ASP_r_i_0_temp = ASP_r_i_1_temp - "001")and(ASP_c_i_0_temp = ASP_c_i_1_temp + "001") else
				'0';
				
r_l_diag_temp <= '1' when (ASP_r_i_0_temp = ASP_r_i_1_temp - "001")and(ASP_c_i_0_temp = ASP_c_i_1_temp - "001") else
				'0';

horiz <= horiz_temp;
vertic <= vertic_temp;
l_r_diag <= l_r_diag_temp;
r_l_diag <= r_l_diag_temp;


end a;