LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY exit_door_testbench IS
END exit_door_testbench;
 
ARCHITECTURE behavior OF exit_door_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT exit_door
    PORT(
         clk : IN  std_logic;
         exit_signal : IN  std_logic;
         persons_exit : IN  std_logic_vector(3 downto 0);
         close_door_signal : OUT  std_logic;
         output_signal : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal exit_signal : std_logic := '0';
   signal persons_exit : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal close_door_signal : std_logic;
   signal output_signal : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: exit_door PORT MAP (
          clk => clk,
          exit_signal => exit_signal,
          persons_exit => persons_exit,
          close_door_signal => close_door_signal,
          output_signal => output_signal
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		exit_signal <= '1';
		persons_exit <= "1100";
		wait for 100 ns;
		exit_signal <= '0';
		persons_exit <= "1001";
		wait for 100 ns;
		exit_signal <= '1';
		persons_exit <= "0001";
		wait for 100 ns;
		exit_signal <= '1';
		persons_exit <= "0000";
		wait for 100 ns;		
      wait;
   end process;

END;
