library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TriggerGenerator is
	Port ( clk 				: in  STD_LOGIC;
          trigger_out 	: out  STD_LOGIC);
end TriggerGenerator;

architecture Behavioral of TriggerGenerator is
	component Counter is
		generic (n: POSITIVE := 10);
		Port( clk 				: in STD_LOGIC;
				enable 			: in STD_LOGIC;
				counterReset 	: in STD_LOGIC; --Active Low
				counter_out 	: out STD_LOGIC_VECTOR(n-1 downto 0)
			  );
	end component;

	Signal Signal_reset			: std_logic; --reset counter
	Signal Signal_counter_out 	: std_logic_vector(23 downto 0);
begin
	Counter1 : Counter generic map (24) port map(clk, '1', Signal_reset, Signal_counter_out);
	process(clk)																				
		constant ms250 : STD_LOGIC_VECTOR(23 downto 0) := "101111101011110000100000";-- To generate 250ms pulse divide the main FPGA board
																												--	clock that is 50 MHz with 4Hz or (1 / 250x10^-3)
		constant ms250And100us : STD_LOGIC_VECTOR(23 downto 0) := "101111101100111110101000"; -- to generate (250ms+100us) pulse divide the
																															-- main FPGA board clock that is 50 MHz with 
																															-- 3.9984 Hz (or 1/250x10^-3+0.1*10^-3)
	begin
		if(Signal_counter_out > ms250 and Signal_counter_out < ms250And100us) then
			trigger_out <= '1';
		else
			trigger_out <= '0';
		end if;
		
		if(Signal_counter_out = ms250And100us or Signal_counter_out = "XXXXXXXXXXXXXXXXXXXXXXXX") then
			Signal_reset <= '0';
		else
			Signal_reset <= '1';
		end if;
	end process;
end Behavioral;

