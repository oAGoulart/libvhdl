library ieee;
use ieee.std_logic_1164.all;
use work.all;

-- 8-bit hex value to 2 segment displays input
entity byte2seg
is
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
end byte2seg;

-- struct of byte2seg
architecture struct of byte2seg
is
  component hex2seg
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
  end component;
begin
  left : hex2seg port map (
    hex => byte(7 downto 4),
    a   => h(1),
    b   => i(1),
    c   => j(1),
    d   => k(1),
    e   => l(1),
    f   => m(1),
    g   => n(1)
  );

  right : hex2seg port map (
    hex => byte(3 downto 0),
    a   => h(0),
    b   => i(0),
    c   => j(0),
    d   => k(0),
    e   => l(0),
    f   => m(0),
    g   => n(0)
  );
end struct;
