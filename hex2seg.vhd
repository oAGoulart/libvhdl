library ieee;
use ieee.std_logic_1164.all;

entity hex2seg is
  port (hex : in   std_logic_vector (3 downto 0);
        seg : out  std_logic_vector (6 downto 0));
end hex2seg;

architecture behav of hex2seg is
begin
  process (hex)
  begin
    case hex is
      when "0000" =>  seg <= "1111110"; -- 0
      when "0001" =>  seg <= "0110000"; -- 1
      when "0010" =>  seg <= "1101101"; -- 2
      when "0011" =>  seg <= "1111001"; -- 3
      when "0100" =>  seg <= "0110011"; -- 4 
      when "0101" =>  seg <= "1011011"; -- 5
      when "0110" =>  seg <= "1011111"; -- 6
      when "0111" =>  seg <= "1110111"; -- 7
      when "1000" =>  seg <= "1111111"; -- 8
      when "1001" =>  seg <= "1111011"; -- 9
      when "1010" =>  seg <= "1110111"; -- A
      when "1011" =>  seg <= "0011111"; -- B
      when "1100" =>  seg <= "1001110"; -- C
      when "1101" =>  seg <= "0111101"; -- D
      when "1110" =>  seg <= "1001111"; -- E
      when "1111" =>  seg <= "1000111"; -- F
      when others =>  seg <= "0000000"; -- n/a
    end case;
  end process;
end behav;
