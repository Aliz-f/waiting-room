library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity waiting_room is
	port(
			clock : in std_logic;
			enter_room : in std_logic;
			exit_room : in std_logic;
			reset_room : in std_logic;
			count_person : out std_logic_vector (3 downto 0);
			exit_door_signal : out std_logic;
			entry_door_signal : out std_logic
	);
end waiting_room;

architecture waiting_room_arch of waiting_room is

component counter
	port(
			command: in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			enable: in std_logic;
			number : out std_logic_vector(3 downto 0) :="0000"
	);
end component;

component entry_door
	port (
			clk : in std_logic;
			enter_signal : in std_logic;
			persons_entry : in std_logic_vector (3 downto 0);
			open_door_signal : out std_logic :='0';
			input_signal : out std_logic :='0'
	);
end component;

component exit_door
	port (
			clk: in std_logic;
			exit_signal : in std_logic;
			persons_exit : in std_logic_vector (3 downto 0);
			close_door_signal : out std_logic:='0';
			output_signal : out std_logic :='0'
	);
end component;

for per_count : counter use entity work.counter(counter_arch);
for en_door : entry_door use entity work.entry_door(entry_door_arch);
for ex_door : exit_door use entity work.exit_door(exit_door_arch);

signal count_temp : std_logic_vector (3 downto 0) :="0000";
signal sim_open_door, sim_close_door, sim_output, sim_input, sim_enable, sim_command : std_logic;

begin

en_door : entry_door port map (clock, enter_room, count_temp, sim_open_door, sim_input);
ex_door : exit_door port map (clock, exit_room, count_temp, sim_close_door, sim_output);
per_count : counter port map (sim_command,  clock, reset_room, sim_enable, count_temp);

sim_enable <= 			'X' when	(reset_room = '1') 
					else 	'0' when (reset_room = '0' and ((sim_output = '1' and sim_input = '1') or (sim_output = '0' and sim_input = '0') )) 
					else 	'1' when (reset_room = '0' and (sim_output = '1' or sim_input = '1'));

sim_command <= 		'1' when (reset_room = '0' and sim_enable = '1' and sim_input = '1') 
					else 	'0' when (reset_room = '0' and sim_enable = '1' and sim_output = '1')
					else 	'X' when ((reset_room = '0' and sim_enable = '0') or (reset_room = '1' and sim_enable = 'X'));

count_person <= count_temp;
entry_door_signal <= '1' when (reset_room = '0' and sim_enable = '1' and sim_input = '1') else '0';
exit_door_signal <= sim_close_door;

end waiting_room_arch;

