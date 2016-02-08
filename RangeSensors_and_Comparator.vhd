library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RangeSensors_and_Comparator is
    Port ( CLK : in  STD_LOGIC;
           RIGHT_PULSE_PIN : in  STD_LOGIC;
           LEFT_PULSE_PIN : in  STD_LOGIC;
           RIGHT_TRIGGER_OUT_PIN : out  STD_LOGIC;
           LEFT_TRIGGER_OUT_PIN : out  STD_LOGIC;
           orientation : out  STD_LOGIC_VECTOR (1 downto 0));
end RangeSensors_and_Comparator;

architecture Behavioral of RangeSensors_and_Comparator is

	component Range_Sensors is
		 Port ( CLK : in  STD_LOGIC;
				  RIGHT_PULSE_PIN : in  STD_LOGIC;
				  LEFT_PULSE_PIN : in  STD_LOGIC;
				  right_distance_out : out  STD_LOGIC_VECTOR (8 downto 0);
				  RIGHT_TRIGGER_OUT_PIN : out  STD_LOGIC;
				  left_distance_out : out  STD_LOGIC_VECTOR (8 downto 0);
				  LEFT_TRIGGER_OUT_PIN : out  STD_LOGIC);
	end component;

	component Comparator is
		 Port ( right_distance_in : in  STD_LOGIC_VECTOR (8 downto 0);
				  left_distance_in : in  STD_LOGIC_VECTOR (8 downto 0);
				  orientation : out  STD_LOGIC_VECTOR (1 downto 0));
	end component;

	signal Signal_right_distance: std_logic_vector (8 downto 0);
	signal Signal_left_distance: std_logic_vector (8 downto 0);
begin

RangeSensors1: Range_Sensors PORT MAP(CLK, RIGHT_PULSE_PIN, LEFT_PULSE_PIN, Signal_right_distance, 
												RIGHT_TRIGGER_OUT_PIN, Signal_left_distance, LEFT_TRIGGER_OUT_PIN);

Comparator1: Comparator PORT MAP(Signal_right_distance, Signal_left_distance, orientation);


end Behavioral;

