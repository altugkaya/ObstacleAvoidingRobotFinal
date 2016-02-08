library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DistanceCalculator is
	    Port(clk 					: in  STD_LOGIC;
				calculationReset 	: in  STD_LOGIC; -- Trigger
				pulse 				: in  STD_LOGIC;
				distance				: out  STD_LOGIC_VECTOR (8 downto 0)
			  );
end DistanceCalculator;

architecture Behavioral of DistanceCalculator is

	component Counter is
		generic(n: POSITIVE := 10);
		Port( clk 			: in STD_LOGIC;
				enable 		: in STD_LOGIC;
				counterReset: in STD_LOGIC; --Active Low
				counter_out : out STD_LOGIC_VECTOR(n-1 downto 0)
			);
	end component;

	signal Pulse_Width : STD_LOGIC_VECTOR(21 downto 0);
begin

Counter2 : Counter generic map(22) port map(clk, pulse, not calculationReset, Pulse_Width);

DistanceCalculator : process(pulse)
								variable result : integer;
								variable multiplier : std_logic_vector(23 downto 0);
							begin
							
									if( pulse = '0' ) then
										multiplier := Pulse_Width * "11";
										result := to_integer(unsigned(multiplier(23 downto 13)));-- Look at the video, (6.01 min)
											if (result > 458 ) then -- 458 cm is the sensor's highest measurement
													distance<= "111111111";
											else
													distance <= STD_LOGIC_VECTOR(to_unsigned(Result,9));
													
											end if;
									end if;
							end process;
end Behavioral;