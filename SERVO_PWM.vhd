library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SERVO_PWM is
    Port ( clk_in : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           selection : in  STD_LOGIC_VECTOR (1 downto 0);
           SERVO : out  STD_LOGIC);
end SERVO_PWM;

architecture Behavioral of SERVO_PWM is

	Signal Signal_SERVO : std_logic;

begin

	process(clk_in, RESET)
		variable duty: integer range 0 to 3 := 0;-- const :=1 656us pulse		const:=3 1.970ms
		variable const: integer;
	begin
		if RESET = '1' then
			const := 2; -- 400Hz Pulse with 1.313 Width. It makes the Servo return to the middle position
			
		elsif rising_edge(clk_in) then
			duty := duty + 1;
			
			if ( selection = "00" ) then
				const :=2;
			elsif ( selection = "01" ) then
				const := 1; -- 400Hz Pulse with 656us Width. It makes the Servo turn all the way to the left
			elsif ( selection = "10" ) then
				const := 3; -- 400Hz Pulse with 1.970 ms Width. It makes the Servo turn all the way to the right
			elsif ( selection = "11" ) then
				const := 3;
			end if;
		end if;
			
			-- PWM is generated here
		if ( duty < const )then
				Signal_SERVO <= '1';
		elsif ( duty >= const ) then
				Signal_SERVO <= '0';
		end if;
	end process;
	
	SERVO <= Signal_SERVO;
	
end Behavioral;

