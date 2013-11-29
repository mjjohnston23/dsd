-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_game_end
--
-- Copyright (C) 2011 -- Version 1.0
-- Author: Jerome Colomb (260349913) and Matthew Johnston (260349319)
-- Date: November 2011

library ieee;
use ieee.std_logic_1164.all;

entity g14_game_end is
	port(
		clk: in bit;
		mc_rst : in bit;
		ASPMC, SPMC: in bit;
		NM: in bit;
		mc_count_out: out bit_vector(3 downto 0); --optional
		FG: out bit
	);
end g14_game_end;

architecture a of g14_game_end is
signal mc_count : bit_vector(3 downto 0);

process(clk, mc_reset)
begin

	if ((mc_rst = '1') then
		mc_count <= "0000";
	end if;
	
	if (clk'event and clk = '1') then
		if (ASPMC = '1' and SPMC = '1') then
			NM <= '1';
			if (mc_count = "10001") then
				FG <= '1';
				NM <= '0';
			else 
				for i in 0 to 7 loop
					if (ASP
	
	end if;
end a;