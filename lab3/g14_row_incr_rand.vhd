-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_row_incr_rand
--
-- Copyright (c) 2011 -- Version 1.0
-- Author: Jerome Colomb (260349913), Matthew Johnston (260349319)
-- Date: October 2011

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;


package define_gra_array2 is
	type gra_array is array (0 to 6) of  std_logic_vector(0 to 13);
end package define_gra_array2;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.define_gra_array.all;

entity g14_row_incr_rand is
	port(no_ins: in bit;
		ASP_empty : in bit_vector(0 to 7);
		GRA_array_in: in gra_array;
		GRA_array_out : out gra_array;
		ASP_dr : out std_logic_vector(0 to 7);
		ASP_lrow : in std_logic_vector(0 to 3);
		ASP_r_0, ASP_r_1, ASP_r_2, ASP_r_3 : out std_logic_vector(0 to 2);
		ASP_r_4, ASP_r_5, ASP_r_6, ASP_r_7 : out std_logic_vector(0 to 2);
		ASP_c_0, ASP_c_1, ASP_c_2, ASP_c_3 : out std_logic_vector(0 to 2);
		ASP_c_4, ASP_c_5, ASP_c_6, ASP_c_7 : out std_logic_vector(0 to 2);
		no_reg: out bit);
end g14_row_incr_rand;


architecture a of g14_row_incr_rand is

begin
process(no_ins,ASP_lrow,GRA_array_in)
variable ASP_lrow_int : integer range 0 to 15;
variable i, j : integer range 0 to 7;
variable two_j, two_j_plus_one : integer range 0 to 15;
variable i_bin, j_bin : std_logic_vector(0 to 2);
variable k : integer range 0 to 8;
begin		
	ASP_lrow_int := to_integer(unsigned(ASP_lrow));
	i := 0;
	j := 0;
	two_j := 0;
	two_j_plus_one := 0;
	k := 0;
	ASP_dr <= "00000000";
	if(no_ins = '1') then
		ASP_dr(ASP_lrow_int) <= '1';
		
		for p in 0 to 42 loop
			two_j := 2*j;
			two_j_plus_one := 2*j + 1;
			exit when (GRA_array_in(i)(two_j) = '0') and (GRA_array_in(i)(two_j_plus_one) = '0');
			if (i < 5) then
				if (j < 6) then
					j := j + 1;
				else
					i := i + 1;
					j := 0;
				end if;
			end if;
			if (i = 5) then
				if (j < 6) then
					j := j + 1;
				end if;
			end if;
		end loop;
		i_bin := std_logic_vector(to_unsigned(i, 3));
		j_bin := std_logic_vector(to_unsigned(j, 3));

				
		for q in 0 to 7 loop
			exit when ASP_empty(k) = '1';
			k := k + 1;
		end loop;
		case k is
			when 0 => 
				ASP_r_0 <= i_bin;
				ASP_c_0 <= j_bin;
				no_reg <= '0';
			when 1 =>
				ASP_r_1 <= i_bin;
				ASP_c_1 <= j_bin;
				no_reg <= '0';
			when 2 =>
				ASP_r_2 <= i_bin;
				ASP_c_2 <= j_bin;
				no_reg <= '0';
			when 3 =>
				ASP_r_3 <= i_bin;
				ASP_c_3 <= j_bin;
				no_reg <= '0';
			when 4 =>
				ASP_r_4 <= i_bin;
				ASP_c_4 <= j_bin;
				no_reg <= '0';
			when 5 =>
				ASP_r_5 <= i_bin;
				ASP_c_5 <= j_bin;
				no_reg <= '0';
			when 6 =>
				ASP_r_6 <= i_bin;
				ASP_c_6 <= j_bin;
				no_reg <= '0';
			when 7 =>
				ASP_r_7 <= i_bin;
				ASP_c_7 <= j_bin;
				no_reg <= '0';
			when 8 =>
				no_reg <= '1';
		end case;
		
		GRA_array_out <= GRA_array_in;
		GRA_array_out(i)(2*j) <= '0';
		GRA_array_out(i)(2*j+1) <= '1';
	end if;		
end process;
end a;