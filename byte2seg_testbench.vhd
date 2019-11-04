library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
 
entity test_byte2seg is
end test_byte2seg;
 
architecture tb of test_byte2seg
is
  -- components
  component byte2seg
    port (
      byte : in   std_logic_vector (7 downto 0);
      h    : out  std_logic_vector (1 downto 0);
      i    : out  std_logic_vector (1 downto 0);
      j    : out  std_logic_vector (1 downto 0);
      k    : out  std_logic_vector (1 downto 0);
      l    : out  std_logic_vector (1 downto 0);
      m    : out  std_logic_vector (1 downto 0);
      n    : out  std_logic_vector (1 downto 0)
    );
  end component;

  -- inputs
  signal byte : std_logic_vector (7 downto 0) := (others => '0');
  
  -- outputs
  signal h : std_logic_vector (1 downto 0);
  signal i : std_logic_vector (1 downto 0);
  signal j : std_logic_vector (1 downto 0);
  signal k : std_logic_vector (1 downto 0);
  signal l : std_logic_vector (1 downto 0);
  signal m : std_logic_vector (1 downto 0);
  signal n : std_logic_vector (1 downto 0);

  -- constants
  constant period : time := 10 ns;
begin
  -- unit under test
  uut : byte2seg port map (
    byte => byte,
    h    => h,
    i    => i,
    j    => j,
    k    => k,
    l    => l,
    m    => m,
    n    => n
  );

  -- stimulus process
  stim_proc : process
  begin        
    for x in 0 to 255 loop
      byte <= conv_std_logic_vector(x, 8);

      wait for period;
    end loop;

    wait;
  end process;
end tb;

  -- stimulus process
  stim_proc : process
  begin        
    for i in 0 to 15 loop
      byte(7 downto 4) <= conv_std_logic_vector(i,4);
      byte(3 downto 0) <= conv_std_logic_vector(i,4);

      wait for period;
    end loop;

    wait;
  end process;
end tb;
