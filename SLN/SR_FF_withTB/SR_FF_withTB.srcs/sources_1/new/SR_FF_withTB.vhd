library IEEE;
use IEEE.std_logic_1164.all;

entity RS_FF is
    port ( R,S,CLK : in std_logic;
           Q, Q_B  : out std_logic);
end RS_FF;

architecture Behavioral_RS_FF of RS_FF is
   signal FF_Q : std_logic;
   signal R_S : std_logic_vector( 1 downto 0);
  begin
    R_S <= R & S;
    Q <= FF_Q; Q_B <= not FF_Q;
    process ( CLK)
    begin
       if( CLK' event and CLK = '1') then
       case R_S is
         when "01" => FF_Q <='1';
         when "10" => FF_Q <='0';
         when "11" => FF_Q <='X';
         when others => null;
       end case;
      end if;
     end process;
end Behavioral_RS_FF;