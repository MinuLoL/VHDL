------------------------------------------------------------------------------
-- 2 bits COMPARATOR
------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity COMPARATOR is
    port ( X, Y : in std_logic_vector(1 downto 0);
           LG, EQ, SM : out std_logic );
end COMPARATOR;

architecture Behavioral of COMPARATOR is
begin
    process( X, Y )
    begin
        if ( X > Y ) then LG <= '1'; EQ <= '0'; SM <= '0';
        elsif ( X < Y ) then LG <= '0'; EQ <= '0'; SM <= '1';
        else LG <= '0'; EQ <= '1'; SM <= '0';
        end if;
    end process;
end Behavioral ;