library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity JK_FF_withTB is
    port(J,K,CLK:in std_logic;
        Q,Q_B:out std_logic);
end JK_FF_withTB;

architecture JK_FF of JK_FF_withTB is
    signal FF_Q:std_logic;
    signal IN_JK:std_logic_vector(1 downto 0);
begin
    IN_JK<=J&K;
    Q<=FF_Q;Q_B<=not FF_Q;
    process(CLK)
    begin
        if(CLK' event and CLK='1')then
         case IN_JK is
            when "01"=>FF_Q<='0';
            when "10"=>FF_Q<='1';
            when "11"=>FF_Q<=not FF_Q;
            when others=>null;
         end case;
        end if;
      end process;
end JK_FF;
