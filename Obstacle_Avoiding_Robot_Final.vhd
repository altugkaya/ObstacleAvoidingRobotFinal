library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Obstacle_Avoiding_Robot_Final is
    Port ( CLK 						: in  STD_LOGIC;
           RIGHT_PULSE_PIN 		: in  STD_LOGIC;
           LEFT_PULSE_PIN 			: in  STD_LOGIC;
           RESET 						: in  STD_LOGIC;
           RIGHT_TRIGGER_OUT_PIN : out  STD_LOGIC;
           LEFT_TRIGGER_OUT_PIN 	: out  STD_LOGIC;
           DC 							: out  STD_LOGIC;
           DC_CLK_OUT_DEBUG 		: out  STD_LOGIC;
           SERVO 						: out  STD_LOGIC;
           SERVO_CLK_OUT_DEBUG 	: out  STD_LOGIC;
           ORIENTATION 				: out  STD_LOGIC_VECTOR (1 downto 0));
end Obstacle_Avoiding_Robot_Final;

architecture Behavioral of Obstacle_Avoiding_Robot_Final is

	Signal Signal_orientation : std_logic_vector (1 downto 0);
	
	component RangeSensors_and_Comparator is
    Port ( CLK 						: in  STD_LOGIC;
           RIGHT_PULSE_PIN 		: in  STD_LOGIC;
           LEFT_PULSE_PIN 			: in  STD_LOGIC;
           RIGHT_TRIGGER_OUT_PIN : out  STD_LOGIC;
           LEFT_TRIGGER_OUT_PIN 	: out  STD_LOGIC;
           orientation 				: out  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
	component DC_Top_Module is
    Port ( CLK 					: in  STD_LOGIC;
           RESET 					: in  STD_LOGIC;
           selection 			: in  STD_LOGIC_VECTOR (1 downto 0);
           DC_CLK_OUT_DEBUG	: out STD_LOGIC;
			  DC 						: out  STD_LOGIC);
	end component;
	
	component SERVO_Top_Module is
    Port ( CLK 						: in  STD_LOGIC;
           RESET 						: in  STD_LOGIC;
           selection 				: in  STD_LOGIC_VECTOR (1 downto 0);
           SERVO 						: out  STD_LOGIC;
           SERVO_CLK_OUT_DEBUG 	: out  STD_LOGIC);
	end component;

begin

RangeSensors_and_Comparator1 : RangeSensors_and_Comparator PORT MAP(CLK, RIGHT_PULSE_PIN, LEFT_PULSE_PIN, RIGHT_TRIGGER_OUT_PIN, LEFT_TRIGGER_OUT_PIN, Signal_orientation);

DC_Top_Module1 : DC_Top_Module PORT MAP(CLK, RESET, Signal_orientation, DC_CLK_OUT_DEBUG, DC);

SERVO_Top_Module1 : SERVO_Top_Module PORT MAP(CLK, RESET, Signal_orientation, SERVO, SERVO_CLK_OUT_DEBUG);

ORIENTATION <= Signal_orientation; 


end Behavioral;

