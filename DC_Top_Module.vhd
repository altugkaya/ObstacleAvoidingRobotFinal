library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DC_Top_Module is
    Port ( CLK 					: in  STD_LOGIC;
           RESET 					: in  STD_LOGIC;
           selection 			: in  STD_LOGIC_VECTOR (1 downto 0);
           DC_CLK_OUT_DEBUG	: out STD_LOGIC;
			  DC 						: out  STD_LOGIC);
end DC_Top_Module;

architecture Behavioral of DC_Top_Module is

	Signal Signal_clk : std_logic;
	
	component DC_Clock_Divider is
    Port ( clk					: in  STD_LOGIC;
			  clk_out_debug 	: out STD_LOGIC;
           clk_out 			: out  STD_LOGIC);
	end component;
	
	component DC_PWM is
    Port ( clk_in 	: in  STD_LOGIC;
           RESET 		: in  STD_LOGIC;
           selection : in  STD_LOGIC_VECTOR(1 downto 0);
           DC 			: out  STD_LOGIC);
	end component;
	
begin

DC_Clock_Divider1 : DC_Clock_Divider PORT MAP (CLK, DC_CLK_OUT_DEBUG, Signal_clk);
DC_PWM1 : DC_PWM PORT MAP (Signal_clk, RESET, selection, DC);

DC_CLK_OUT_DEBUG <= Signal_clk;


end Behavioral;

