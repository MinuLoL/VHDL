library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity JK_FF_tb is
end JK_FF_tb;

architecture JK_FF_tb of JK_FF_tb is
    component JK_FF_withTB
     port(J,K,CLK:in std_logic;
        Q,Q_B:out std_logic);
     end component;
     constant STEP:time:=100ns;
     signal CLK,J,K:std_logic;
     signal Q,Q_B:std_logic;
begin
    U0:JK_FF_withTB port map(J=>J,K=>K,CLK=>CLK,Q=>Q,Q_B=>Q_B);
    process
    begin
        CLK<='0';
        wait for STEP/2; CLK<='1';
        wait for STEP/2;
    end process;
    
    process
    begin
        J<='0';K<='0';
        wait for STEP/3;J<='1';
        wait for STEP;  K<='1';
        wait for STEP/3; J<='0';
        wait for STEP/2; K<='0';
        wait for STEP; K<='1';
        wait for STEP;  J<='1';K<='0';
        wait;
        
     end process;
end JK_FF_tb;
