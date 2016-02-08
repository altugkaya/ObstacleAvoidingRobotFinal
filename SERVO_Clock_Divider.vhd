library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SERVO_Clock_Divider is
    Port ( clk : in  STD_LOGIC;
           clk_out_debug : out  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end SERVO_Clock_Divider;

architecture Behavioral of SERVO_Clock_Divider is

	Signal Signal_clk : std_logic;

begin

	process(clk)
		variable cnt: integer range 0 to 15625; --	This number was found experimentally. It is able to generate an 400 Hz PWM signal
															 --	at the end of the PWM Module
	begin
	
		if rising_edge(clk) then
			cnt := cnt + 1 ;
		
			if cnt = 15625 then
				Signal_clk <= not Signal_clk;
			end if;
		end if;
	end process;
	
	clk_out <= Signal_clk;
	clk_out_debug <= Signal_clk;


end Behavioral;

