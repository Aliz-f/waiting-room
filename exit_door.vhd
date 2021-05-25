library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity exit_door is
	port (
			clk: in std_logic;
			exit_signal : in std_logic;
			persons_exit : in std_logic_vector (3 downto 0);
			close_door_signal : out std_logic:='0';
			output_signal : out std_logic :='0'
	);
end exit_door;

architecture exit_door_arch of exit_door is

begin
	process(clk)
		begin
			if(rising_edge(clk)) then	
				if (exit_signal = '1') then
					if (persons_exit = 1) then close_door_signal <= '1';
														output_signal <= '1';
														--output_signal <= '0' after 50 ns;
					elsif (persons_exit > 1) then 
														close_door_signal <= '0';
														output_signal <= '1';
														--output_signal <= '0' after 50 ns;

					elsif (persons_exit = 0 ) then
														close_door_signal <= '1';
														output_signal <= '0';
					end if;
				
				elsif (exit_signal = '0') then 
													 output_signal <= '0';
				end if;
			end if;
	end process;

end exit_door_arch;

