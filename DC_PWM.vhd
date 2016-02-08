library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DC_PWM is
    Port ( clk_in 	: in  STD_LOGIC;
           RESET 		: in  STD_LOGIC;
           selection : in  STD_LOGIC_VECTOR(1 downto 0);
           DC 			: out  STD_LOGIC);
end DC_PWM;

architecture Behavioral of DC_PWM is

	Signal Signal_duty_cycle : std_logic;

begin

	process(clk_in, RESET)
		variable duty: integer range 0 to 100; 
		variable const: integer range 0 to 100; 
	begin
		if (RESET = '1') then
			Signal_duty_cycle <= '0';
			const := 0;
			
		elsif (rising_edge(clk_in)) then
			
			duty := duty + 1;
			
			if (selection = "00") then
				const := 100; -- 100 kHz 80% duty cycle square wave
			else
				const := 80; -- 100 kHz 50% duty cycle square wave
			end if;
			
			if (duty < const) then
				Signal_duty_cycle <= '1';
			elsif (duty >= const) then
				Signal_duty_cycle <= '0';
			end if;
		end if;
	end process;
	
	DC <= Signal_duty_cycle;

end Behavioral;

