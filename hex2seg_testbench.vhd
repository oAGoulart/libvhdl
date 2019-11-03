library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
 
entity test_hex2seg is
end test_hex2seg;
 
architecture tb of test_hex2seg
is
  -- components
  component hex2seg
    port (
      hex : in   std_logic_vector (3 downto 0);
      a   : out  std_logic;
      b   : out  std_logic;
      c   : out  std_logic;
      d   : out  std_logic;
      e   : out  std_logic;
      f   : out  std_logic;
      g   : out  std_logic
    );
  end component;

  -- inputs
  signal hex : std_logic_vector (3 downto 0) := (others => '0');
  
  -- outputs
  signal a : std_logic;
  signal b : std_logic;
  signal c : std_logic;
  signal d : std_logic;
  signal e : std_logic;
  signal f : std_logic;
  signal g : std_logic;

  -- constants
  constant period : time := 10 ns;
begin
  -- unit under test
  uut : hex2seg port map (
    hex => hex,
    a   => a,
    b   => b,
    c   => c,
    d   => d,
    e   => e,
    f   => f,
    g   => g
  );

  -- stimulus process
  stim_proc : process
  begin        
    for i in 0 to 15 loop
      hex <= conv_std_logic_vector(i, 4);

      wait for period;
    end loop;

    wait;
  end process;
end tb;
