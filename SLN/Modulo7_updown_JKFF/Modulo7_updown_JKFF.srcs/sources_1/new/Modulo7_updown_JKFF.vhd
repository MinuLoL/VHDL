library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Up_Counter_m5 is port (
rst, clk ,A : in std_logic;
q2,q1, q0 : inout std_logic );
end Up_Counter_m5;

architecture mixed of Up_Counter_m5 is
signal j2,k2,j1,k1,j0,k0: std_logic;
begin
j2<=(not A and not q1 and not q0)or(A and q1 and q0);
k2<=(not A and not q1 and not q0)or(A and q1);
j1<=(not A and not q0)or(A and q0);
k1<=(not A and not q0)or(A and q0)or q2;
j0<=(not A and q1)or(q2 and not q1)or (A and not q2);
k0<='1';

process 
(clk, rst)
Begin
if rst = '1' then 
q2 <= '0'; q1 <= '0'; q0 <= '0'; 
elsif rising_edge
(clk) then 
     q2<=(j2 and not q2)or(not k2 and q2);q1<=(j1 and not q1)or(not k1 and q1);q0<=(j0 and not q0)or(not k0 and q0);
     --dont need to change
end if;
end process;
End mixed; 