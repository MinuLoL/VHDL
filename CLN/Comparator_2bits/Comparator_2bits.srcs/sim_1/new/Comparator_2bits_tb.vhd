------------------------------------------------------------------------------
-- 2 bits COMP_TESTBENCH
------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity COMP_TEST is
end COMP_TEST;

architecture COMP_TEST of COMP_TEST is
    signal X, Y : std_logic_vector(1 downto 0);
    signal LG, EQ, SM : std_logic; 
    component COMPARATOR
        port ( X, Y : in std_logic_vector(1 downto 0);
                LG, EQ, SM : out std_logic );
    end component;
begin
    U0:COMPARATOR port map ( X => X, Y => Y, LG => LG, EQ => EQ, SM => SM );
    process
    begin
        X <= "00"; Y <= "00";
        for T_Y in 0 to 4 loop
            for T_X in 0 to 3 loop
                wait for 100 ns; X <= X + '1';
            end loop;
            Y <= Y + '1';
        end loop;
        wait;
    end process;
end COMP_TEST;
