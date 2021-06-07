LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;

ENTITY hex2ssd_test IS
END hex2ssd_test;

ARCHITECTURE behavior OF hex2ssd_test IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT HEX2SSD2
    port(
        x : in STD_LOGIC_VECTOR(3 downto 0);
        f : out STD_LOGIC_VECTOR(7 downto 0);
        an: out STD_LOGIC_VECTOR(3 downto 0) );
    END COMPONENT;
    
    signal x : std_logic_vector(3 downto 0);
    signal f : std_logic_vector(7 downto 0);
    
BEGIN
-- Instantiate the Unit Under Test (UUT)
    uut: HEX2SSD2 PORT MAP (
           x => x, f => f );
    process
    begin
        x <= (others => '0');
        for T in 0 to 15 loop       --0to15 then end next state
            wait for 50ns; x <= x + 1;   --800ns/16 = 50ns
        end loop;
        wait;
    end process;
END;