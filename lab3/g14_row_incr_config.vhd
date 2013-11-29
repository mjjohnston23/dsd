-- Determining the row configuration of disks stored in ASP or SP registers
--
-- entity name: g14_row_incr_config
--
-- Copyright (c) 2011 -- Version 1.0
-- Author: Jerome Colomb (260349913), Matthew Johnston (260349319)
-- Date: October 2011

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;

package define_gra_array is
	type gra_array is array (0 to 6) of  std_logic_vector(0 to 13);
end package define_gra_array;

library ieee;
use ieee.std_logic_1164.all;

package define_ASP_reg is
	type asp_reg is array (0 to 7) of std_logic_vector(2 downto 0);
end package define_ASP_reg;


library ieee;
use ieee.std_logic_1164.all;
use work.define_gra_array.all;
use work.define_ASP_reg.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity g14_row_incr_config is
 port(
      GRA_array_in : in gra_array;
      horizont, vertic, l_r_diag, r_l_diag: in bit;
      ASP_r_i, ASP_c_i: in asp_reg;
      ASP_lrow : in std_logic_vector(3 downto 0);
      i : in std_logic_vector(2 downto 0);
      ASP_r_0, ASP_r_1, ASP_r_2, ASP_r_3: out std_logic_vector(2 downto 0);
      ASP_r_4, ASP_r_5, ASP_r_6, ASP_r_7: out std_logic_vector(2 downto 0);
      ASP_c_0, ASP_c_1, ASP_c_2, ASP_c_3: out std_logic_vector(2 downto 0);
      ASP_c_4, ASP_c_5, ASP_c_6, ASP_c_7: out std_logic_vector(2 downto 0);
      disk_ins: out bit;
      no_ins:   out bit;
      ASP_dr:   out bit_vector(0 to 7)
     );
end g14_row_incr_config;

architecture a of g14_row_incr_config is
begin

incr_config: process(horizont, vertic, l_r_diag, r_l_diag, ASP_r_i, ASP_c_i, i, GRA_array_in, ASP_lrow)
variable c1, r0, c0, r1: std_logic_vector(2 downto 0);
variable c1_int, c0_int, r0_int, r1_int, i_int  : integer range 0 to 15;
variable ASP_r_i_temp, ASP_c_i_temp : asp_reg;
variable ASP_lrow_int : integer range 0 to 15;
variable disk_ins_temp : bit;

begin 
	ASP_lrow_int := to_integer(unsigned(ASP_lrow));
   r0 := ASP_r_i(0); 
   c0 := ASP_c_i(0);
   c1 := ASP_c_i(ASP_lrow_int - 1);
   r1 := ASP_r_i(ASP_lrow_int - 1);
   r0_int := to_integer(unsigned(r0));
   r1_int := to_integer(unsigned(r1));
   c0_int := to_integer(unsigned(c0));
   c1_int := to_integer(unsigned(c1));
   i_int := to_integer(unsigned(i));
   
   ASP_r_i_temp := ASP_r_i;
   ASP_c_i_temp := ASP_c_i;
   disk_ins <= '0';
   no_ins <= '0';
   ASP_dr <= "00000000";
   disk_ins_temp := '0';

if (horizont = '1') then   
   if (c0_int /= 0) then
      if ((GRA_array_in(r0_int)(2*(c0_int-1)) = '0') and (GRA_array_in(r0_int)(2*(c0_int-1)+1)) = '0') then
         
          for i in 0 to 2 loop
			ASP_r_i_temp(i+1) := ASP_r_i(i);
		  end loop;
		  		 
		  for i in 0 to 2 loop
			ASP_c_i_temp(i+1) := ASP_c_i(i);
		  end loop;
			  
          ASP_r_i_temp(0) := r0;
          ASP_c_i_temp(0) := c0 - '1';
          disk_ins_temp := '1';
	elsif ((c1_int /= 6)and(disk_ins_temp = '0')) then 
		if ((GRA_array_in(r0_int)(2*(c1_int+1)) = '0')and(GRA_array_in(r0_int)(2*(c1_int+1)+1) = '0')) then
			ASP_r_i_temp(ASP_lrow_int) := r0;
			ASP_c_i_temp(ASP_lrow_int) := c1 + '1';
			disk_ins_temp := '1';
		end if;
	 else 
	  no_ins <= '1';
	  ASP_dr(i_int) <= '1';
	  end if;
	 end if;
end if;  

if (vertic = '1') then   
   if (c0_int /= 0) then
      if ((GRA_array_in(r0_int-1)(2*(c0_int)) = '0') and (GRA_array_in(r0_int-1)(2*(c0_int)+1)) = '0') then
         
          for i in 0 to 2 loop
			ASP_r_i_temp(i+1) := ASP_r_i(i);
		  end loop;
		  		 
		  for i in 0 to 2 loop
			ASP_c_i_temp(i+1) := ASP_c_i(i);
		  end loop;
			  
          ASP_r_i_temp(0) := r0 - '1';
          ASP_c_i_temp(0) := c0;
          disk_ins_temp := '1';
	elsif ((c1_int /= 6)and(disk_ins_temp = '0')) then 
		if ((GRA_array_in(r1_int+1)(2*(c1_int)) = '0')and(GRA_array_in(r1_int+1)(2*(c1_int)+1) = '0')) then
			ASP_r_i_temp(ASP_lrow_int) := r1 + '1';
			ASP_c_i_temp(ASP_lrow_int) := c1;
			disk_ins_temp := '1';
		end if;
	 else 
	  no_ins <= '1';
	  ASP_dr(i_int) <= '1';
	  end if;
	 end if;
end if; 

if (l_r_diag = '1') then   
   if (c0_int /= 0) then
      if ((GRA_array_in(r0_int-1)(2*(c0_int+1)) = '0') and (GRA_array_in(r0_int-1)(2*(c0_int+1)+1)) = '0') then
         
          for i in 0 to 2 loop
			ASP_r_i_temp(i+1) := ASP_r_i(i);
		  end loop;
		  		 
		  for i in 0 to 2 loop
			ASP_c_i_temp(i+1) := ASP_c_i(i);
		  end loop;
			  
          ASP_r_i_temp(0) := r0 - '1';
          ASP_c_i_temp(0) := c0 + '1';
          disk_ins_temp := '1';
	elsif ((c1_int /= 6)and(disk_ins_temp = '0')) then 
		if ((GRA_array_in(r1_int+1)(2*(c1_int-1)) = '0')and(GRA_array_in(r1_int+1)(2*(c1_int-1)+1) = '0')) then
			ASP_r_i_temp(ASP_lrow_int) := r1 + '1';
			ASP_c_i_temp(ASP_lrow_int) := c1 - '1';
			disk_ins_temp := '1';
		end if;
	 else 
	  no_ins <= '1';
	  ASP_dr(i_int) <= '1';
	  end if;
	 end if;
end if;  

if (r_l_diag = '1') then   
   if (c0_int /= 0) then
      if ((GRA_array_in(r0_int-1)(2*(c0_int-1)) = '0') and (GRA_array_in(r0_int-1)(2*(c0_int-1)+1)) = '0') then
         
          for i in 0 to 2 loop
			ASP_r_i_temp(i+1) := ASP_r_i(i);
		  end loop;
		  		 
		  for i in 0 to 2 loop
			ASP_c_i_temp(i+1) := ASP_c_i(i);
		  end loop;
			  
          ASP_r_i_temp(0) := r0 - '1';
          ASP_c_i_temp(0) := c0 - '1';
          disk_ins_temp := '1';
	elsif ((c1_int /= 6)and(disk_ins_temp = '0')) then 
		if ((GRA_array_in(r1_int+1)(2*(c1_int+1)) = '0')and(GRA_array_in(r1_int+1)(2*(c1_int+1)+1) = '0')) then
			ASP_r_i_temp(ASP_lrow_int) := r1 + '1';
			ASP_c_i_temp(ASP_lrow_int) := c1 + '1';
			disk_ins_temp := '1';
		end if;
	 else 
	  no_ins <= '1';
	  ASP_dr(i_int) <= '1';
	  end if;
	 end if;
end if; 

if (horizont = '0' and vertic = '0' and l_r_diag = '0' and r_l_diag = '0') then
	no_ins <= '1';
end if;

	ASP_r_0 <= ASP_r_i_temp(0);
	ASP_r_1 <= ASP_r_i_temp(1);
	ASP_r_2 <= ASP_r_i_temp(2);
	ASP_r_3 <= ASP_r_i_temp(3);
	ASP_r_4 <= ASP_r_i_temp(4);			
	ASP_r_5 <= ASP_r_i_temp(5);
	ASP_r_6 <= ASP_r_i_temp(6);
	ASP_r_7 <= ASP_r_i_temp(7);
	
	ASP_c_0 <= ASP_c_i_temp(0);
	ASP_c_1 <= ASP_c_i_temp(1);
	ASP_c_2 <= ASP_c_i_temp(2);
	ASP_c_3 <= ASP_c_i_temp(3);
	ASP_c_4 <= ASP_c_i_temp(4);			
	ASP_c_5 <= ASP_c_i_temp(5);
	ASP_c_6 <= ASP_c_i_temp(6);
	ASP_c_7 <= ASP_c_i_temp(7);
	disk_ins <= disk_ins_temp;
end process;
end a;