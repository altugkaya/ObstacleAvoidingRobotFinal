library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DC_Clock_Divider is
    Port ( clk			: in  STD_LOGIC;
			  clk_out_debug 	: out STD_LOGIC;
           clk_out 			: out  STD_LOGIC);
end DC_Clock_Divider;

architecture Behavioral of DC_Clock_Divider is

	Signal Signal_clk: std_logic;

begin

	process(clk)
		variable cnt: integer range 0 to 1;	--	to generate 12.5 MHz clock
	begin
		
		if ( rising_edge(clk) ) then 
		
			cnt := cnt + 1; -- cnt is incremented in every clk cycle once
			
			if ( cnt = 1 ) then
			
				Signal_clk <= not Signal_clk;
			end if;
		end if;
	end process;
	
	clk_out <= Signal_clk;
	clk_out_debug <= Signal_clk;


end Behavioral;

