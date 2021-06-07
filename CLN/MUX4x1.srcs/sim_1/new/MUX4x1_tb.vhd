library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SELECTOR_4_1_TEST is
end SELECTOR_4_1_TEST;

architecture SELECTOR_4_1_TEST of SELECTOR_4_1_TEST is
    component SELECTOR_4_1 
        port ( A, B, C, D : in std_logic;
            SEL : in std_logic_vector(1 downto 0);
            OUT_4_1 : out std_logic );
    end component;
    
    signal IN_VECTOR : std_logic_vector(3 downto 0);
    signal SEL : std_logic_vector(1 downto 0);
    signal OUT_4_1 : std_logic;
begin
    U0:SELECTOR_4_1 port map ( A => IN_VECTOR(0), B => IN_VECTOR(1),
                                C => IN_VECTOR(2), D => IN_VECTOR(3),
                                SEL => SEL, OUT_4_1 => OUT_4_1 );
    process
    begin
        IN_VECTOR <= "0000";
        for T in 0 to 16 loop
                wait for 100 ns; IN_VECTOR <= IN_VECTOR + '1';
        end loop;
        wait;
    end process;
process
    begin
        SEL <= "00";
        for T in 0 to 6 loop
            wait for 250 ns; SEL <= SEL + '1';
        end loop;
        wait;
    end process;
end SELECTOR_4_1_TEST;