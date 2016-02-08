library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Comparator is
    Port ( right_distance_in : in  STD_LOGIC_VECTOR (8 downto 0);
           left_distance_in : in  STD_LOGIC_VECTOR (8 downto 0);
           orientation : out  STD_LOGIC_VECTOR (1 downto 0));
end Comparator;

architecture Behavioral of Comparator is

	signal Signal_orientation_0 : std_logic;
	signal Signal_orientation_1 : std_logic;

begin

	process(right_distance_in)
	begin
			
		if ( right_distance_in > "000001010" AND right_distance_in <= "000010100" ) then -- 10 cm < right_distance_in =< 20cm
			
			Signal_orientation_0 <= '1';
		
		elsif ( right_distance_in > "000010100" ) then -- right_distance_in > 20 cm
		
			Signal_orientation_0 <= '0';
		end if;
	end process;
	
	
	process(left_distance_in)
	begin
	
		if ( left_distance_in > "000001010" AND left_distance_in <= "000010100" ) then -- 10 cm < left_distance_in =< 20cm
		
			Signal_orientation_1 <= '1';
		
		elsif ( left_distance_in > "000010100" ) then --	left_distance_in > 20cm
		
			Signal_orientation_1 <= '0';
		end if;
	end process;
	
	orientation <= Signal_orientation_1 & Signal_orientation_0;

end Behavioral;

