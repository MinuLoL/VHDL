--------------------------------------------------------
-- Dataflow description of 3x8 Decoder
---------------------------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

--entity DEC_3x8 is port (
--        B2, B1, B0 : in std_logic;
--        F0, F1, F2, F3, F4, F5, F6, F7 : out std_logic );
--end DEC_3x8;

--architecture DEC_3x8 of DEC_3x8 is
--begin
--    F0 <= not B2 and not B1 and not B0;
--    F1 <= not B2 and not B1 and B0;
--    F2 <= not B2 and B1 and not B0;
--    F3 <= not B2 and B1 and B0;
--    F4 <= B2 and not B1 and not B0;
--    F5 <= B2 and not B1 and B0;
--    F6 <= B2 and B1 and not B0;
--    F7 <= B2 and B1 and B0;
--end DEC_3x8;

---------------------------------------------------------------------------------
-- Decoder_3x8_1
-- Behavioral Description I using Process, Case/when
---------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Decoder_3x8_1 is
    port ( IN_BCD : in std_logic_vector(2 downto 0);
            OUT_OCT : out std_logic_vector(7 downto 0) );
end Decoder_3x8_1;

architecture behavioral of Decoder_3x8_1 is
begin
    process( IN_BCD )
    begin
        case IN_BCD is
            when "000" => OUT_OCT <= "00000001";
            when "001" => OUT_OCT <= "00000010";
            when "010" => OUT_OCT <= "00000100";
            when "011" => OUT_OCT <= "00001000";
            when "100" => OUT_OCT <= "00010000";
            when "101" => OUT_OCT <= "00100000";
            when "110" => OUT_OCT <= "01000000";
            when others => OUT_OCT <= "10000000";
        end case;
    end process;
end behavioral;

----------------------------------------------------------
-- DDecoder_3x8_2
-- Behavioral Description II Using Process 
----------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.std_logic_unsigned.all;

--entity Decoder_3x8_2 is
--    port ( IN_BCD : in std_logic_vector( 2 downto 0 );
--           OUT_OCT : out std_logic_vector( 7 downto 0 ));
--end Decoder_3x8_2;

--architecture behavioral of Decoder_3x8_2 is
--begin
--    process( IN_BCD )
--        variable T : integer range 0 to 7;
--        variable OCT : std_logic_vector( 7 downto 0 );
--    begin
--        OCT := ( others => '0' );
--        T := conv_integer( IN_BCD );
--        OCT( T ) := '1';
--        OUT_OCT <= OCT;
--    end process;
--end behavioral;