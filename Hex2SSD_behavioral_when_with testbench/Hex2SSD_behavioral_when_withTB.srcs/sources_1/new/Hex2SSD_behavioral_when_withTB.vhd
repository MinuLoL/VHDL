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
    f <= "0111111" when X= "0000" else
         "0110000" when X= "0001" else
         "1011011" when X= "0010" else
         "1001111" when X= "0011" else
         "1100110" when X= "0100" else
         "1101101" when X= "0101" else
         "1111101" when X= "0110" else
         "0100111" when X= "0111" else
         "1111111" when X= "1000" else
         "1101111" when X= "1001" else
         "1110111" when X= "1010" else
         "1111100" when X= "1011" else
         "0111001" when X= "1100" else
         "1011110" when X= "1101" else
         "1111001" when X= "1110" else
         "1110001" ;
    an <= "1111";
end Behavioral;
