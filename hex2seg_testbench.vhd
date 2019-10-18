library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
 
entity test_hex2seg is
end test_hex2seg;
 
architecture behav of test_hex2seg
is
  component hex2seg
    port (hex : in   std_logic_vector (3 downto 0);
          seg : out  std_logic_vector (6 downto 0));
  end component;
   
  signal hex : std_logic_vector (3 downto 0) := (others => '0');
  signal seg : std_logic_vector (6 downto 0);
begin
  uut: hex2seg port map (
    hex => hex,
    seg => seg
  );

  stim_proc: process
  begin        
    for i in 0 to 15 loop
      hex <= conv_std_logic_vector(i, 4);
      wait for 10 ns; -- could be more
    end loop;
    wait;
  end process;
end behav;
