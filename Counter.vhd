library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter is
		generic(n : POSITIVE := 10);
		Port ( 	clk 			: in  STD_LOGIC;
					enable 		: in  STD_LOGIC;
					counterReset: in  STD_LOGIC;		--Active Low
					counter_out : out  STD_LOGIC_VECTOR (n-1 downto 0) 
				);
end Counter;

architecture Behavioral of Counter is
	signal count : STD_LOGIC_VECTOR(n-1 downto 0);
begin

process(clk,counterReset)
begin
	if( counterReset = '0' ) then -- Active Low Reset
		count <= (others => '0');
		
	elsif( rising_edge(clk) ) then
		if( enable = '1' ) then
			count <= count + 1;	-- If the module is enabled, it will increment "count" for each rising edge of the clk
			
		end if;
		
	end if;
end process;

counter_out <= count;

end Behavioral;