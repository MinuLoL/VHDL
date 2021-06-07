----------------------------------------------------------------------------
-- MUX_4_1: Dataflow description using When/else
----------------------------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--entity SELECTOR_4_1 is
--port ( A, B, C, D : in std_logic;
--SEL : in std_logic_vector(1 downto 0);
--OUT_4_1 : out std_logic );
--end SELECTOR_4_1;
--architecture SELECTOR_4_1 of SELECTOR_4_1 is
--begin
--OUT_4_1 <= A when SEL = "00" else
--B when SEL = "01" else
--C when SEL = "10" else
--D;
--end SELECTOR_4_1;

-----------------------------------------------------------------------------------------------
---- MUX_4-1: Behavioral description using Process/ if/then
------------------------------------------------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--entity SELECTOR_4_1 is
--port ( A, B, C, D : in std_logic;
--SEL : in std_logic_vector(1 downto 0);
--OUT_4_1 : out std_logic );
--end SELECTOR_4_1;
--architecture SELECTOR_4_1 of SELECTOR_4_1 is
--begin
--process( SEL, A, B, C, D )
--begin
--if (SEL = "00") then OUT_4_1 <= A;
--elsif (SEL = "01") then OUT_4_1 <= B;
--elsif (SEL = "10")then OUT_4_1 <= C;
--else OUT_4_1 <= D;
--end if;
--end process;
--end SELECTOR_4_1;

----------------------------------------------------------------------------------------------
-- MUX_4-1: Behavioral description using Process/case/when
---------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity SELECTOR_4_1 is
    port ( A, B, C, D : in std_logic;
        SEL : in std_logic_vector(1 downto 0);
        OUT_4_1 : out std_logic );
end SELECTOR_4_1;

architecture SELECTOR_4_1 of SELECTOR_4_1 is
begin
    process( SEL, A, B, C, D )
    begin
        case SEL is
            when "00" => OUT_4_1 <= A;
            when "01" => OUT_4_1 <= B;
            when "10" => OUT_4_1 <= C;
            when others => OUT_4_1 <= D;
        end case;
    end process;
end SELECTOR_4_1;