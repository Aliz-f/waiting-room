library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity entry_door is
	port (
			clk : in std_logic;
			enter_signal : in std_logic;
			persons_entry : in std_logic_vector (3 downto 0);
			open_door_signal : out std_logic :='0';
			input_signal : out std_logic :='0'
	);
	
end entry_door;

architecture entry_door_arch of entry_door is

begin

	process(clk)	
		begin
			if (rising_edge(clk)) then
				if (enter_signal = '1') then 
					if (persons_entry < 15) then input_signal <= '1';
														open_door_signal <= '1';
														--input_signal <= '0' after 50 ns;
														open_door_signal <= '0' after 50 ns;
					end if;
				elsif (enter_signal = '0') then
														input_signal <= '0';
														open_door_signal <= '0';
				end if;
			end if;
	end process;	

end entry_door_arch;

