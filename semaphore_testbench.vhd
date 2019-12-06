library ieee;
use ieee.std_logic_1164.all;
 
entity test_semaphore is
end test_semaphore;
 
architecture tb of test_semaphore
is
  -- components
  component fsm
    port (
      clk : in std_logic;
      rst : in std_logic;

      red    : out std_logic;
      yellow : out std_logic;
      green  : out std_logic
    );
  end component;

  -- inputs
  signal clk : std_logic := '0';
  signal rst : std_logic := '0';

  -- output
  signal red    : std_logic;
  signal yellow : std_logic;
  signal green  : std_logic;

  -- constants
  constant period : time := 10 ns;
begin
  -- unit under test
  uut : fsm port map (
    clk    => clk,
    rst    => rst,
    red    => red,
    yellow => yellow,
    green  => green
  );

  -- changes on period
  clk <= not clk after period / 2;
  rst <= not rst after period * 60;
end tb;
