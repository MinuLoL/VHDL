--------------------------------------------------------------------------------
--Testbench for ALU2
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY alu2_tb IS
END alu2_tb;
ARCHITECTURE behavior OF alu2_tb IS
--Component Declaration for the Unit Under Test (UUT)
COMPONENT ALU2
PORT(
   a, b : IN std_logic_vector(7 downto 0);
   sel: IN std_logic_vector(3 downto 0);
   cin : IN std_logic;
   y : OUT std_logic_vector(7 downto 0) );
END COMPONENT;

--Inputs & Output signals
signal a, b : std_logic_vector(7 downto 0) := (others => '0');
signal sel : std_logic_vector(3 downto 0) := (others => '0');
signal cin : std_logic := '0';
signal y : std_logic_vector(7 downto 0);

BEGIN
uut: ALU2 PORT MAP(
      a => a, b => b , sel => sel , cin => cin , y => y );
stim_proc: process  --Stimulus process
begin
a <="00000000";
b <="00000000";
sel<= (others => '0');
cin <= '0';
for T in 0 to 255 loop
wait for 100ns;
sel <= sel + 1;
a<= a+1;
b<=b-1;
end loop;
wait;
end process;
END;