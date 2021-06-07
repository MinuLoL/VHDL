-------------------------------------------------------------------------------------
-- BCD2SSD_tt.VHD :Behavioral desription of HEX2SSD using "when" statements
--------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd2ssd_tt is
    port(
         x : in STD_LOGIC_vector(3 downto 0);
         f : out STD_LOGIC_VECTOR (6 downto 0) );
end bcd2ssd_tt;

architecture behavioral of bcd2ssd_tt is
begin
    f <= "0000001" when X= "0000" else --0
         "1001111" when X= "0001" else --1
         "0010010" when X= "0010" else --2
         "0000110" when X= "0011" else --3
         "1001100" when X= "0100" else --4
         "0100100" when X= "0101" else --5
         "0100000" when X= "0110" else --6
         "0001101" when X= "0111" else --7
         "0000000" when X= "1000" else --8
         "0000100" when X= "1001" else --9
         "0110000" ; --E
end Behavioral;
