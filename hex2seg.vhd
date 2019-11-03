library ieee;
use ieee.std_logic_1164.all;

-- 4-bit hex value to segment display input
entity hex2seg
is
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
end hex2seg;

-- behavior of hex2seg
architecture behav of hex2seg is
begin
  process (hex)
  begin
    -- find each output with boolean logic
    a <= (
      (hex(3) and not hex(2) and not hex(1)) or
      (not hex(3) and hex(2) and hex(0)) or
      (not hex(3) and hex(1) and hex(0)) or
      (hex(2) and hex(1) and hex(0)) or
      (not hex(2) and not hex(0)) or
      (hex(3) and not hex(0))
    );

    b <= (
      (not hex(3) and not hex(1) and not hex(0)) or
      (hex(3) and not hex(1) and hex(0)) or
      (not hex(3) and hex(1) and hex(0)) or
      (not hex(2) and not hex(0)) or
      (not hex(2) and not hex(1)) or
      (not hex(3) and not hex(2))
    );

    c <= (
      (not hex(3) and not hex(1)) or
      (hex(3) and not hex(2)) or
      (not hex(3) and hex(2)) or
      (not hex(1) and hex(0)) or
      (not hex(3) and hex(0))
    );

    d <= (
      (not hex(3) and not hex(2) and not hex(0)) or
      (hex(3) and not hex(1) and not hex(0)) or
      (hex(2) and hex(1) and not hex(0)) or
      (hex(2) and not hex(1) and hex(0)) or
      (not hex(2) and hex(1) and hex(0))
    );

    e <= (
      (not hex(2) and not hex(0)) or
      (hex(1) and not hex(0)) or
      (hex(3) and hex(2)) or
      (hex(3) and hex(1))
    );

    f <= (
      (not hex(3) and hex(2) and not hex(1)) or
      (not hex(1) and not hex(0)) or
      (hex(3) and not hex(2)) or
      (hex(2) and not hex(0)) or
      (hex(3) and hex(1))
    );
    
    g <= (
      (not hex(3) and hex(2) and not hex(1)) or
      (hex(3) and not hex(2)) or
      (hex(1) and not hex(0)) or
      (not hex(2) and hex(1)) or
      (hex(3) and hex(0))
    );
  end process;
end behav;
