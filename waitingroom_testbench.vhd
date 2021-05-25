LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY waitingroom_testbench IS
END waitingroom_testbench;
 
ARCHITECTURE behavior OF waitingroom_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT waiting_room
    PORT(
         clock : IN  std_logic;
         enter_room : IN  std_logic;
         exit_room : IN  std_logic;
         reset_room : IN  std_logic;
         count_person : OUT  std_logic_vector(3 downto 0);
         exit_door_signal : OUT  std_logic;
         entry_door_signal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal enter_room : std_logic := '0';
   signal exit_room : std_logic := '0';
   signal reset_room : std_logic := '0';

 	--Outputs
   signal count_person : std_logic_vector(3 downto 0);
   signal exit_door_signal : std_logic;
   signal entry_door_signal : std_logic;

   -- Clock period definitions
   constant clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: waiting_room PORT MAP (
          clock => clock,
          enter_room => enter_room,
          exit_room => exit_room,
          reset_room => reset_room,
          count_person => count_person,
          exit_door_signal => exit_door_signal,
          entry_door_signal => entry_door_signal
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		enter_room <='1';
		enter_room <='0' after 50 ns;
		exit_room <= '0';
		reset_room <= '0';
		wait for 100 ns;	
		enter_room <='1';
		enter_room <='0' after 50 ns;
		exit_room <= '0';
		reset_room <= '0';
		wait for 100 ns;	
		enter_room <='1';
		enter_room <='0' after 50 ns;
		exit_room <= '0';
		reset_room <= '0';
		wait for 100 ns;	
		enter_room <='1';
		enter_room <='0' after 50 ns;
		exit_room <= '0';
		reset_room <= '0';
		-- Enter 4
		wait for 100 ns;	
		enter_room <='0';
		exit_room <= '1';
		exit_room <= '0' after 50 ns;
		reset_room <= '0';
		wait for 100 ns;	
		enter_room <='0';
		exit_room <= '1';
		exit_room <= '0' after 50 ns;
		reset_room <= '0';
		wait for 100 ns;	
		enter_room <='0';
		exit_room <= '1';
		exit_room <= '0' after 50 ns;
		reset_room <= '0';
		--exit 3
		wait for 100 ns;	
		enter_room <='1';
		exit_room <= '1';
		enter_room <= '0' after 50 ns;
		exit_room <= '0' 	after 50 ns;
		reset_room <= '0';
		--hold
		wait for 100 ns;	
		enter_room <='1';
		exit_room <= '1';
		enter_room <= '0' after 50 ns;
		exit_room <= '0' 	after 50 ns;
		reset_room <= '1';
		--reset
		--reset
      wait;
   end process;

END;
