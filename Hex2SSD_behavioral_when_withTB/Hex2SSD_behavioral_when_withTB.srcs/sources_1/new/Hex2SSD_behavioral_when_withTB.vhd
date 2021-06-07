library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HEX2SSD2 is
    port(
        x : in STD_LOGIC_VECTOR(3 downto 0);
        f : out STD_LOGIC_VECTOR(7 downto 0);
        an: out STD_LOGIC_VECTOR(3 downto 0) );
end HEX2SSD2;

architecture behavioral of HEX2SSD2 is
begin
    f <= "00111111" when X= "0000" else
         "00110000" when X= "0001" else
         "01011011" when X= "0010" else
         "01001111" when X= "0011" else
         "01100110" when X= "0100" else
         "01101101" when X= "0101" else
         "01111101" when X= "0110" else
         "00100111" when X= "0111" else
         "01111111" when X= "1000" else
         "01101111" when X= "1001" else
         "01110111" when X= "1010" else
         "01111100" when X= "1011" else
         "00111001" when X= "1100" else
         "01011110" when X= "1101" else
         "01111001" when X= "1110" else
         "01110001" ;
    an <= "1111";
end Behavioral;