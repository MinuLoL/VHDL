-------------------------------------------------------------
-- Modulo
--7 Up Counter
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Up_Counter_m7 is port (
rst, clk : in std_logic;
q2,q1, q0 : inout std_logic );
end Up_Counter_m7;
architecture mixed of Up_Counter_m7 is
signal d2, d1, d0: std_logic;
begin
d2 <= (q1 and q0) or (q2 and not q1);
d1 <= (not q1 and q0) or (not q2 and q1 and not q0);
d0 <= (not q2 and not q0) or (not q1 and not q0);
process 
(clk, rst)
Begin
if rst = '1' then 
q2 <= '0'; q1 <= '0'; q0 <= '0'; 
elsif rising_edge
(clk) then 
q2 <= d2; q1 <= d1; q0 <= d0;
end if;
end process;
End mixed; 