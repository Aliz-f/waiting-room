LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY entry_door_testbench IS
END entry_door_testbench;
 
ARCHITECTURE behavior OF entry_door_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT entry_door
    PORT(
         clk : IN  std_logic;
         enter_signal : IN  std_logic;
         persons_entry : IN  std_logic_vector(3 downto 0);
         open_door_signal : OUT  std_logic;
         input_signal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal enter_signal : std_logic := '0';
   signal persons_entry : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal open_door_signal : std_logic;
   signal input_signal : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entry_door PORT MAP (
          clk => clk,
          enter_signal => enter_signal,
          persons_entry => persons_entry,
          open_door_signal => open_door_signal,
          input_signal => input_signal
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
		enter_signal <= '1';
		persons_entry <= "1111";
		wait for 100 ns;	
		enter_signal <= '1';
		persons_entry <= "0110";
		wait for 100 ns;	
		enter_signal <= '0';
		persons_entry <= "0111";
      wait;
   end process;

END;
