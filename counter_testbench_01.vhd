
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter_testbench_01 IS
END counter_testbench_01;
 
ARCHITECTURE behavior OF counter_testbench_01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         command : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         number : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal command : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal number : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
			command => command,
          clk => clk,
          reset => reset,
          enable => enable,
          number => number
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns; -- inc 
		command <= '1';
		reset <='0';
		enable <= '1';
		wait for 100 ns; -- inc 
		command <= '1';
		reset <='0';
		enable <= '1';
		wait for 100 ns; --reset	
		command <= 'X';
		reset <='1';
		enable <= 'X';
		wait for 100 ns; -- inc 
		command <= '1';
		reset <='0';
		enable <= '1';
		wait for 100 ns; -- inc 
		command <= '1';
		reset <='0';
		enable <= '1';
		wait for 100 ns;--dec
		command <= '0';
		reset <='0';
		enable <= '1';
		wait for 100 ns; --hold
		command <= 'X';
		reset <='0';
		enable <= '0';
      wait;
   end process;

END;
