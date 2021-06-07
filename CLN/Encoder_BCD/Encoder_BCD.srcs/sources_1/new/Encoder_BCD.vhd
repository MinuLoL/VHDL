------------------------------------------------------------------------------
-- BCD ENCODER
------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity ENCODER is
port ( IN_10 : in std_logic_vector(9 downto 0);
OUT_BCD : out std_logic_vector(3 downto 0) );
end ENCODER;

architecture ENCODER of ENCODER is
begin
    process( IN_10 )
    begin
        case IN_10 is
            when "0000000001" => OUT_BCD <= "0000";
            when "0000000010" => OUT_BCD <= "0001";
            when "0000000100" => OUT_BCD <= "0010";
            when "0000001000" => OUT_BCD <= "0011";
            when "0000010000" => OUT_BCD <= "0100";
            when "0000100000" => OUT_BCD <= "0101";
            when "0001000000" => OUT_BCD <= "0110";
            when "0010000000" => OUT_BCD <= "0111";
            when "0100000000" => OUT_BCD <= "1000";
            when "1000000000" => OUT_BCD <= "1001";
            when others => OUT_BCD <= "1111";
        end case;
    end process;
end ENCODER;

------------------------------------------------------------------------------
-- BCD ENCODER
--------------------------------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;
--entity ENCODER is
--port ( IN_10 : in std_logic_vector( 9 downto 0 );
--OUT_BCD : out std_logic_vector( 3 downto 0 ) );
--end ENCODER;
--architecture ENCODER of ENCODER is
--begin
--process( IN_10 )
--variable BCD : std_logic_vector( 3 downto 0 );
--begin
--BCD := ( others => '0' ); -- Variable assignment :=
--for T in 0 to 9 loop
--if ( IN_10(T) = '1' ) then
--BCD := BCD or conv_std_logic_vector( T, 4 );
--end if;
--end loop;
--OUT_BCD <= BCD;
--end process;
--end ENCODER