-------------------------------------------------------------
-- Modulo-6 Up/Down Counter X=0: Up
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity UpDown_Counter_m6 is port ( 
rst, clk , x: in std_logic;
q2,q1, q0 : inout std_logic );
end UpDown_Counter_m6;
architecture mixed of UpDown_Counter_m6 is
signal d2, d1, d0: std_logic;
begin
d2 <= (not x and q2 and not q0) or ( not x and q1 and q0) or (x and q2 and q0) or ( x and not q2 and not q1 and not q0); 
d1 <= (x and q2 and not q0) or (x and q1 and q0) or (not x and q1 and not q0) or (not x and not q2 and not q1 and q0);
d0 <= not q0 ;
process (clk, rst)
Begin
if rst = '1' then 
q2 <= '0'; q1 <= '0'; q0 <= '0'; 
elsif rising_edge(clk) then 
q2 <= d2; q1 <= d1; q0 <= d0;
end if;
end process;
End mixed;