--SR_LATCH testbench

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch_tb is
end SR_Latch_tb;

architecture SR_Latch_tb of SR_Latch_tb is
    component SR_Latch
        port(R,S:in std_logic;
            Q,Q_B:out std_logic);
     end component;
     
     constant STEP:time:=100ns;
     signal R,S:std_logic;
     signal Q,Q_B:std_logic;
begin
    U0:SR_Latch port map(R=>R,S=>S,Q=>Q,Q_B=>Q_B);
    process
    begin
        R<='0';S<='0';
     wait for STEP; S<='1';
     wait for STEP; S<='0';
     wait for STEP; R<='1';
     wait for STEP; R<='0';
     wait for STEP; R<='1';S<='1';
     wait;
    end process;
end SR_Latch_tb;
