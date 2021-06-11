-------------------------------------------------------------
-- -- TestBench : TB_m7_upcounter.vhd 
-------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TB_m7_upcounter IS
END TB_m7_upcounter;
ARCHITECTURE behavior OF TB_m7_upcounter IS 
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT Up_Counter_m5
port (
x,rst, clk : in std_logic;
y:out std_logic;
q2, q1, q0 : inout std_logic );
END COMPONENT;
--Inputs
signal rst : std_logic := '1';
signal clk : std_logic := '0';
signal x:std_logic:='0';
signal y:std_logic:='0';
-- BiDirs
signal sq2, sq1, sq0 : std_logic ;
-- Clock period definitions
constant clk_period : time := 10 ns;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: Up_Counter_m5 PORT MAP (
y=>y,x=>x,rst => rst, clk => clk, q2 => sq2, q1 => sq1, q0 => sq0 );
-- Clock process definitions
clk_process :process
begin
clk <= '1';
wait for clk_period/2;
clk <= '0';
wait for clk_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
rst <= '1', '0' after (10*clk_period+2ns) ;
x <='0', '1' after 200 ns ;
-- insert stimulus here 
wait;
end process;
END;