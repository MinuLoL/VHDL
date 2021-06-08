-------------------------------------------------------------
-- TestBench : X=0: Up
-------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TB_modulo6_Up_Down IS
END TB_modulo6_Up_Down;

ARCHITECTURE behavior OF TB_modulo6_Up_Down IS 
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT UpDown_Counter_m6
PORT( rst, clk, x : IN std_logic;
q2, q1, q0 : INOUT std_logic );
END COMPONENT;
--Inputs
signal rst, clk : std_logic;
signal x : std_logic := '0';
--BiDirs
signal q2,q1,q0 : std_logic;
-- Clock period definitions
constant clk_period : time := 10 ns;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: UpDown_Counter_m6 PORT MAP (
rst => rst, clk => clk, x => x, q2 => q2, q1 => q1, q0 => q0 );
-- Clock process definitions
clk_process :process
begin
clk <= '1'; wait for clk_period/2;
clk <= '0'; wait for clk_period/2;
end process;
-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
rst <= '1', '0' after 51 ns;
x <='0', '1' after 150 ns ; 
wait for clk_period*30;
end process;
END;