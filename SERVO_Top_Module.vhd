library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SERVO_Top_Module is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           selection : in  STD_LOGIC_VECTOR (1 downto 0);
           SERVO : out  STD_LOGIC;
           SERVO_CLK_OUT_DEBUG : out  STD_LOGIC);
end SERVO_Top_Module;

architecture Behavioral of SERVO_Top_Module is

	Signal Signal_clk : std_logic;
	
	component SERVO_Clock_Divider is
    Port ( clk : in  STD_LOGIC;
           clk_out_debug : out  STD_LOGIC;
           clk_out : out  STD_LOGIC);
	end component;
	
	component SERVO_PWM is
    Port ( clk_in : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           selection : in  STD_LOGIC_VECTOR (1 downto 0);
           SERVO : out  STD_LOGIC);
	end component;

begin

SERVO_Clock_Divider1 : SERVO_Clock_Divider PORT MAP(CLK, SERVO_CLK_OUT_DEBUG, Signal_clk);
SERVO_PWM1 : SERVO_PWM PORT MAP (Signal_clk, RESET, selection, SERVO);

SERVO_CLK_OUT_DEBUG <= Signal_clk;

end Behavioral;