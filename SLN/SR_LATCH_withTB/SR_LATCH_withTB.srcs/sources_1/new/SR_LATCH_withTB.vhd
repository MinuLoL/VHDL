--SR_LATCH

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SR_Latch is
    port(R,S:in std_logic;
        Q,Q_B:out std_logic);
end SR_Latch;

architecture DATA_FLOW of SR_Latch is
    signal FF_Q,FF_Q_B:std_logic;
begin
    FF_Q<=R nor FF_Q_B;
    FF_Q_B<=S nor FF_Q;
    Q<=FF_Q;Q_B<=FF_Q_B;

end DATA_FLOW;