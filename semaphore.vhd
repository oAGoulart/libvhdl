library ieee;
use ieee.std_logic_1164.all;

-- semaphore ports
entity fsm
is
  port (
    clk : in std_logic;
    rst : in std_logic;

    red    : out std_logic;
    yellow : out std_logic;
    green  : out std_logic
  );
end fsm;

-- behavior of the semaphore
architecture behav of fsm
is
  -- semaphore states
  type fsm_states is (
    st_none,
    st_stop,
    st_await,
    st_go
  );

  -- signals
  signal curr_st : fsm_states := st_none;
  signal count   : integer    := 0;
begin
  -- state process
  st_fsm: process(rst, clk)
  begin
    if (rst = '1') then
      curr_st <= st_none;
    elsif (clk'event and clk = '1') then
      count <= count + 1;

      case (count) is
        when 1 =>
          curr_st <= st_go;
        when 9 =>
          curr_st <= st_await;
        when 11 =>
          curr_st <= st_stop;
        when 31 =>
          count <= 1;
          curr_st <= st_go;
        when others =>
          null;
      end case;
    end if;
  end process st_fsm;
  
  -- result process
  rlt_fsm: process(curr_st)
  begin
    red <= '0';
    yellow <= '0';
    green <= '0';

    case (curr_st) is
      when st_stop =>
        red <= '1';
      when st_await =>
        yellow <= '1';
      when st_go =>
        green <= '1';
      when others =>
        null;
    end case;
  end process rlt_fsm;
end behav;
