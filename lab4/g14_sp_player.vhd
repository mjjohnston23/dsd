-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_sp_player
--
-- Copyright (C) 2011 -- Version 1.0
-- Author: Jerome Colomb (260349913) and Matthew Johnston (260349319)
-- Date: November 2011
library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity g14_sp_player is
	port(
		NM, ASPMC : in bit;
		row_inp : in std_logic_vector(2 downto 0);
		col_inp : in std_logic_vector(2 downto 0);
		row_out : out std_logic_vector(2 downto 0);
		col_out : out std_logic_vector(2 downto 0);
		gra_in : out std_logic_vector(1 downto 0);
		clk: in bit;
		gra_out : in  std_logic_vector(1 downto 0);
		
		mc_count: out bit_vector(3 downto 0);
		SPMC, gra_read, gra_write, gra_conflict, check_bit_out: out bit
	);
end g14_sp_player;

architecture a of g14_sp_player is
signal check_bit, SPMC_temp, gra_conflict_temp, gra_write_temp, gra_read_temp : bit;
signal mc_count_temp : std_logic_vector(3 downto 0);
signal gra_in_temp: std_logic_vector(1 downto 0);
signal row_out_temp, col_out_temp : std_logic_vector(2 downto 0);

begin

process(clk)
begin
	if (clk'event and clk = '1') then
		row_out_temp <= row_inp;
		col_out_temp <= col_inp;
		gra_read_temp <= '1';
		if (check_bit = '0') then --read cycle
			gra_write_temp <= '0';
			check_bit <= '1';
		else --check_bit is 1 (write cycle)
			check_bit <= '0';
			gra_write_temp <= '1';
			if (gra_out = "00") then --cell is empty
				gra_conflict_temp <= '0';
				if((NM = '0') and (ASPMC = '1')) then
					gra_in_temp <= "11";
					mc_count_temp <= (mc_count_temp) + "0001";
					SPMC_temp <= '1';
				end if;
			else --cell is occupied already
				gra_conflict_temp <= '1';
				SPMC_temp <= '0';
			end if;
		end if;
	end if;	
end process;
SPMC <= SPMC_temp;
gra_conflict <= gra_conflict_temp;
gra_write <= gra_write_temp;
gra_read <= gra_read_temp;
gra_in <= gra_in_temp;
row_out <= row_out_temp;
col_out <= col_out_temp;
mc_count <= to_bitvector(mc_count_temp);
check_bit_out <= check_bit;
end a;