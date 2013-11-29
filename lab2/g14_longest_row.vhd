-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_longest_row.vhd
--
-- Copyright (c) 2011
-- Version 1.0
-- Author: Johnston and Colomb
-- Date: 7 October 2011

library ieee;
use ieee.std_logic_1164.all;

package define_ASP is
	type ASP_array is array(0 to 3) of std_logic_vector(2 downto 0);
end package define_ASP;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

library work;
use work.define_ASP.all;

entity g14_longest_row is

	port(ASP_r_0, ASP_r_1, ASP_r_2, ASP_r_3: in ASP_array;
		ASP_r_4, ASP_r_5, ASP_r_6, ASP_r_7: in ASP_array;
		ASP_c_0, ASP_c_1, ASP_c_2, ASP_c_3: in ASP_array;
		ASP_c_4, ASP_c_5, ASP_c_6, ASP_c_7: in ASP_array;
		ASP_dr: in bit_vector(0 to 7);
		ASP_empty: in bit_vector(0 to 7);
		NM: in bit;
		ASP_lrow: buffer std_logic_vector(0 to 2));
end g14_longest_row;

architecture a of g14_longest_row is 



begin

longest_row: process(ASP_dr, ASP_empty, NM)

variable ASP_r_i, ASP_c_i : ASP_array;
variable ASP_length, no_cells : std_logic_vector(0 to 2);
variable ASP_lrow_temp : integer range 0 to 7;


begin
ASP_lrow_temp := 0;
ASP_length := "000";
no_cells := "000";
ASP_r_i := ASP_r_0;

if (NM = '1') then
	for i in 0 to 7 loop
		if (ASP_dr(i) = '0') then
			if (ASP_empty(i) = '0') then
				no_cells := "000";
				case i is
				when 0 =>
					ASP_r_i := ASP_r_0;
					ASP_c_i := ASP_c_0;
				when 1 =>
					ASP_r_i := ASP_r_1;
					ASP_c_i := ASP_c_1;
				when 2 =>
					ASP_r_i := ASP_r_2;
					ASP_c_i := ASP_c_2;
				when 3 =>
					ASP_r_i := ASP_r_3;
					ASP_c_i := ASP_c_3;
				when 4 =>
					ASP_r_i := ASP_r_4;
					ASP_c_i := ASP_c_4;
				when 5 =>
					ASP_r_i := ASP_r_5; 
					ASP_c_i := ASP_c_5;
				when 6 =>
					ASP_r_i := ASP_r_6;
					ASP_c_i := ASP_c_6;
				when 7 =>
					ASP_r_i := ASP_r_7;
					ASP_c_i := ASP_c_7;
				end case;
	

	for j in 0 to 3 loop
		if(ASP_r_i(j) /= "111")
			then no_cells := no_cells + 1;
		end if;
		if(no_cells > ASP_length) then
			ASP_length := no_cells;
			ASP_lrow_temp := i;
		end if;
	
	end loop;
end if;
end if;
end loop;
ASP_lrow <= conv_std_logic_vector(ASP_lrow_temp, 3);
case ASP_lrow is
when "000" =>
	ASP_r_i := ASP_r_0;
	ASP_c_i := ASP_c_0;
when "001" =>
	ASP_r_i := ASP_r_1;
	ASP_c_i := ASP_c_1;
when "010" =>
	ASP_r_i := ASP_r_2;
	ASP_c_i := ASP_c_2;
when "011" =>
	ASP_r_i := ASP_r_3;
	ASP_c_i := ASP_c_3;
when "100" =>
	ASP_r_i := ASP_r_4;
	ASP_c_i := ASP_c_4;
when "101" =>
	ASP_r_i := ASP_r_5;
	ASP_c_i := ASP_c_5;
when "110" =>
	ASP_r_i := ASP_r_6;
	ASP_c_i := ASP_c_6;
when "111" =>
	ASP_r_i := ASP_r_7;
	ASP_c_i := ASP_c_7;
end case;


end if;

end process;

end a;