library ieee;
library lpm;
use ieee.std_logic_1164.all;

use lpm.lpm_components.all;

entity g14_7_segment_decoder is

port( ascii_code : in std_logic_vector(6 downto 0);
		segments_out : out std_logic_vector(6 downto 0));
		clk : in bit;
end g14_7_segment_decoder;

architecture a of g14_7_segment_decoder is
begin
crc_table : lpm_rom -- use the altera rom library macrocell
GENERIC MAP(
	lpm_widthad => 7, -- sets the width of the ROM address bus
	lpm_numwords => 128, -- sets the words stored in the ROM
	lpm_outdata => "REGISTERED", -- no register on the output
	lpm_address_control => "REGISTERED", -- no register on the input
	lpm_file => "lcd_decoder_rom.mif", -- the ascii file containing the
	ROM data
	lpm_width => 7) -- the width of the word stored in each ROM location
PORT MAP(address => ascii_code, inclock => clk, outclock => clk, q => led_segments);

end a;