-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_asp_registers
--
-- Copyright (C) 2011 -- Version 1.0
-- Author: Jerome Colomb (260349913) and Matthew Johnston (260349319)
-- Date: November 2011

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;




entity g14_asp_registers is
port(
	clk : in bit;
	asp_rst : in bit;
	read_reg, write_reg : in bit;
	asp_reg_id : in std_logic_vector(2 downto 0);
	asp_cell_id : in std_logic_vector(1 downto 0);
	
	asp_row_in : in std_logic_vector (2 downto 0);
	asp_column_in : in std_logic_vector (2 downto 0);
	
	asp_row_out : out std_logic_vector(2 downto 0);
	asp_column_out : out std_logic_vector(2 downto 0)
	);
end g14_asp_registers;

architecture a of g14_asp_registers is
signal ASP_r_0, ASP_r_1, ASP_r_2, ASP_r_3 : std_logic_vector(11 downto 0);
signal ASP_r_4, ASP_r_5, ASP_r_6, ASP_r_7 : std_logic_vector(11 downto 0);
signal ASP_c_0, ASP_c_1, ASP_c_2, ASP_c_3 : std_logic_vector (11 downto 0);
signal ASP_c_4, ASP_c_5, ASP_c_6, ASP_c_7 : std_logic_vector (11 downto 0);
begin
process (clk, asp_rst)

begin
	if (clk'event and clk = '1') then
		if (read_reg = '1') then
			if (asp_reg_id = "000") then
				asp_row_out(0) <= ASP_r_0(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_0(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_0(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_0(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_0(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_0(3*to_integer(unsigned(asp_cell_id)) + 2);
			elsif (asp_reg_id = "001") then
				asp_row_out(0) <= ASP_r_1(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_1(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_1(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_1(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_1(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_1(3*to_integer(unsigned(asp_cell_id)) + 2);
			elsif (asp_reg_id = "010") then
				asp_row_out(0) <= ASP_r_2(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_2(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_2(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_2(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_2(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_2(3*to_integer(unsigned(asp_cell_id)) + 2);
			elsif (asp_reg_id = "011") then
				asp_row_out(0) <= ASP_r_3(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_3(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_3(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_3(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_3(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_3(3*to_integer(unsigned(asp_cell_id)) + 2);
			elsif (asp_reg_id = "100") then
				asp_row_out(0) <= ASP_r_4(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_4(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_4(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_4(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_4(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_4(3*to_integer(unsigned(asp_cell_id)) + 2);
			elsif (asp_reg_id = "101") then
				asp_row_out(0) <= ASP_r_5(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_5(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_5(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_5(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_5(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_5(3*to_integer(unsigned(asp_cell_id)) + 2);
			elsif (asp_reg_id = "110") then 
				asp_row_out(0) <= ASP_r_6(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_6(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_6(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_6(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_6(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_6(3*to_integer(unsigned(asp_cell_id)) + 2);
			elsif (asp_reg_id = "111") then
				asp_row_out(0) <= ASP_r_7(3*to_integer(unsigned(asp_cell_id))); 
				asp_row_out(1) <= ASP_r_7(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_row_out(2) <= ASP_r_7(3*to_integer(unsigned(asp_cell_id)) + 2);
				asp_column_out(0) <= ASP_c_7(3*to_integer(unsigned(asp_cell_id))); 
				asp_column_out(1) <= ASP_c_7(3*to_integer(unsigned(asp_cell_id)) + 1); 
				asp_column_out(2) <= ASP_c_7(3*to_integer(unsigned(asp_cell_id)) + 2);
			end if;
		end if;
		if (write_reg = '1') then
			if (asp_reg_id = "000") then
				ASP_r_0(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_0(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_0(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_0(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_0(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_0(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			elsif(asp_reg_id = "001") then
				ASP_r_1(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_1(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_1(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_1(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_1(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_1(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			elsif(asp_reg_id = "010") then
				ASP_r_2(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_2(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_2(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_2(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_2(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_2(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			elsif(asp_reg_id = "011") then
				ASP_r_3(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_3(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_3(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_3(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_3(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_3(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			elsif(asp_reg_id = "100") then
				ASP_r_4(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_4(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_4(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_4(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_4(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_4(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			elsif(asp_reg_id = "101") then
				ASP_r_5(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_5(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_5(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_5(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_5(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_5(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			elsif(asp_reg_id = "110") then
				ASP_r_6(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_6(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_6(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_6(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_6(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_6(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			elsif(asp_reg_id = "111") then
				ASP_r_7(3*to_integer(unsigned(asp_cell_id))) <= asp_row_in(0);
				ASP_r_7(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_row_in(1);
				ASP_r_7(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_row_in(2);
				ASP_c_7(3*to_integer(unsigned(asp_cell_id))) <= asp_column_in(0);
				ASP_c_7(3*to_integer(unsigned(asp_cell_id)) +1) <= asp_column_in(1);
				ASP_c_7(3*to_integer(unsigned(asp_cell_id)) +2) <= asp_column_in(2);
			end if;
		end if;
	end if;
	
	if (asp_rst = '1') then
		ASP_r_0 <= "000000000000";
		ASP_r_1 <= "000000000000";
		ASP_r_2 <= "000000000000";
		ASP_r_3 <= "000000000000";
		ASP_r_4 <= "000000000000";
		ASP_r_5 <= "000000000000";
		ASP_r_6 <= "000000000000";
		ASP_r_7 <= "000000000000";
		ASP_c_0 <= "000000000000";
		ASP_c_1 <= "000000000000";
		ASP_c_2 <= "000000000000";
		ASP_c_3 <= "000000000000";
		ASP_c_4 <= "000000000000";
		ASP_c_5 <= "000000000000";
		ASP_c_6 <= "000000000000";
		ASP_c_7 <= "000000000000";
	end if;
	end process;
end a;