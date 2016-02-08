library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RangeSensor is
    Port ( fpgaclk 			: in  STD_LOGIC;
           pulse_pin 		: in  STD_LOGIC;
           trigger_out_pin : out  STD_LOGIC;
			  distance_out		: out STD_LOGIC_VECTOR(8 downto 0)
			 );
end RangeSensor;

architecture Behavioral of RangeSensor is

	component DistanceCalculator is
	    Port(clk 					: in  STD_LOGIC;
				calculationReset 	: in  STD_LOGIC; -- Trigger
				pulse 				: in  STD_LOGIC;
				distance 			: out  STD_LOGIC_VECTOR (8 downto 0)
			  );
	end component;
	
	component TriggerGenerator is
		Port (clk 			: in  STD_LOGIC;
				trigger_out : out  STD_LOGIC
			  );
	end component;

	Signal Signal_distance_out : STD_LOGIC_VECTOR(8 downto 0);
	Signal Signal_trigger_out	: STD_LOGIC;

begin

TriggerGen	 : TriggerGenerator port map (fpgaclk, Signal_trigger_out);
DistanceCal	 : DistanceCalculator port map (fpgaclk, Signal_trigger_out, pulse_pin, distance_out);

trigger_out_pin <= Signal_trigger_out;


end Behavioral;