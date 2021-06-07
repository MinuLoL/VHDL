library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HEX2SSD2 is
    port(
        x : in STD_LOGIC_VECTOR(3 downto 0);
        f : out STD_LOGIC_VECTOR(6 downto 0);
        an: out STD_LOGIC_VECTOR(3 downto 0) ); --segment on
end HEX2SSD2;

architecture behavioral of HEX2SSD2 is
begin   --1or0 by Cathode or anode
    F <= "0000001" when X= "0000" else
         "1001111" when X= "0001" else
         "0010010" when X= "0010" else
         "0000110" when X= "0011" else
         "1001100" when X= "0100" else
         "0100100" when X= "0101" else
         "0100000" when X= "0110" else
         "0001101" when X= "0111" else
         "0000000" when X= "1000" else
         "0000100" when X= "1001" else
         "0001000" when X= "1010" else
         "1100000" when X= "1011" else 
         "0110001" when X= "1100" else
         "1000010" when X= "1101" else
         "0110000" when X= "1110" else
         "0111000" ;
    an <= "1111";   --1 or 0 by cathode or anode
end Behavioral;