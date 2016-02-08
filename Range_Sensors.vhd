library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Range_Sensors is
    Port ( CLK : in  STD_LOGIC;
           RIGHT_PULSE_PIN : in  STD_LOGIC;
           LEFT_PULSE_PIN : in  STD_LOGIC;
           right_distance_out : out  STD_LOGIC_VECTOR (8 downto 0);
           RIGHT_TRIGGER_OUT_PIN : out  STD_LOGIC;
           left_distance_out : out  STD_LOGIC_VECTOR (8 downto 0);
           LEFT_TRIGGER_OUT_PIN : out  STD_LOGIC);
end Range_Sensors;

architecture Behavioral of Range_Sensors is

	component RangeSensor is
		 Port ( fpgaclk 			: in  STD_LOGIC;
				  pulse_pin 		: in  STD_LOGIC;
				  trigger_out_pin : out  STD_LOGIC;
				  distance_out		: out STD_LOGIC_VECTOR(8 downto 0)
				 );
	end component;	

begin

RangeSensor_RIGHT: RangeSensor PORT MAP (CLK, RIGHT_PULSE_PIN, RIGHT_TRIGGER_OUT_PIN, right_distance_out);
RangeSensor_LEFT: RangeSensor PORT MAP (CLK, LEFT_PULSE_PIN, LEFT_TRIGGER_OUT_PIN, left_distance_out);

end Behavioral;

