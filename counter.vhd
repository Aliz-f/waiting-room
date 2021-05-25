library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	port(
			command: in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			enable: in std_logic;
			number : out std_logic_vector(3 downto 0) :="0000"
	);
end counter;

architecture counter_arch of counter is

	signal count : std_logic_vector (3 downto 0) := "0000";
	
	begin
		process (clk)
			begin
				if (falling_edge(clk)) then
					if 	(reset = '1' and enable = 'X' and command = 'X') then count <= "0000"; 		--RESET
					elsif (reset = '0' and enable = '0' and command = 'X') then count <= count; 		--HOLD
					elsif	(reset = '0' and enable = '1' and command = '1') then count <= count +1; 	--INC
					elsif (reset = '0' and enable = '1' and command = '0') then count <= count -1; 	--DEC
					end if;
				end if;
		end process;
		number <= count;

end counter_arch;
