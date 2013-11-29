-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_gra_arr
--
-- Copyright (C) 2011 -- Version 1.0
-- Author: Jerome Colomb (260349913) and Matthew Johnston (260349319)
-- Date: November 2011

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;

package define_gra_array is
	type gra_array is array (6 downto 0) of  std_logic_vector(13 downto 0);
end package define_gra_array;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.define_gra_array.all;

entity g14_gra_arr is
port(
	row_inp: in std_logic_vector(2 downto 0);
	col_inp: in std_logic_vector(2 downto 0);
	clk: in bit;
	gra_rst: in bit;
	gra_read, gra_write : in bit;
	gra_in: in std_logic_vector(1 downto 0);
	gra_out: out std_logic_vector(1 downto 0)
	);
end g14_gra_arr;

architecture a of g14_gra_arr is 
	signal gra_arr : gra_array;
	signal gra_out_temp : std_logic_vector(1 downto 0);
	begin
	
	process(clk, gra_rst)

	begin
			if(clk'event and clk = '1') then
			if (gra_read = '1') then
				gra_out_temp(0) <= gra_arr(to_integer(unsigned(row_inp)))(2*to_integer(unsigned(col_inp)) + 1);
				gra_out_temp(1) <= gra_arr(to_integer(unsigned(row_inp)))(2*to_integer(unsigned(col_inp)));
			end if;
			if (gra_write = '1') then
				gra_arr(to_integer(unsigned(row_inp)))(2*to_integer(unsigned(col_inp)) + 1) <= gra_in(0);
				gra_arr(to_integer(unsigned(row_inp)))(2*to_integer(unsigned(col_inp))) <= gra_in(1);
			end if;	
		end if;
	
		if (gra_rst = '1') then
			gra_arr(0) <= "00000000000000";
			gra_arr(1) <= "00000000000000";
			gra_arr(2) <= "00000000000000";
			gra_arr(3) <= "00000000000000";
			gra_arr(4) <= "00000000000000";
			gra_arr(5) <= "00000000000000";
			gra_arr(6) <= "00000000000000";
		end if;	
	end process;
	gra_out <= gra_out_temp;	
end a;