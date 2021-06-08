----------------------------------------------------------------
--| Design file name: ASCII_5x7_font.vhd
----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;

entity ASCII_5x7_font is 
        GENERIC (clk_divider1: INTEGER := 6000000);    --12MHz to 1Hz~2     
        port ( but1, but2,clk :   in std_logic;
                an :   out bit_vector(7 downto 0);
                dot:   out bit_vector(7 downto 0)   );
end ASCII_5x7_font;

-------------------------------------------------------------------
ARCHITECTURE ASCII_5x7_font OF ASCII_5x7_font IS
       TYPE state IS (S0, S1, S2, S3, S4, S5, S6, S7);
       
       SIGNAL  pr_state, nx_state: state;
       signal   E: bit;
       signal  NUM: unsigned (6 DOWNTO 0) := "0010100";
       TYPE memory IS ARRAY (0 TO 7) of bit_vector (7 downto 0);   
       signal  rom: memory; 

BEGIN
       ----- Clock generator (E->500Hz): -------------
       PROCESS (clk)
              VARIABLE count: INTEGER RANGE 0 TO clk_divider1;
              VARIABLE count1: INTEGER RANGE 0 TO 10000000;
                                                
       BEGIN
              
              IF (clk'EVENT AND clk='1') THEN
                   count := count + 1;
                   count1 := count1 +1;
                   
                   IF (count=clk_divider1) THEN
                           E <= NOT E;
                           count := 0;
                    elsif(count1 = 10000000) THEN
                           NUM <=NUM + "1";
                           count1 := 0;
                                                                                                           
                  END IF;
              END IF;
       END PROCESS;

      ----- Lower section of FSM: --------------------
      PROCESS (E)
      BEGIN
             IF (E'EVENT AND E='1') THEN
                  IF (but1='1') THEN
  --                      NUM <= NUM + "1";
                       pr_state <= S0;
                  ELSIF  (but2='1') THEN
                        pr_state <= S0;
    --                    NUM <= NUM - "1";
                 ELSE
                        NUM <= NUM;
                        pr_state <= nx_state;
                 END IF;
             END IF;
       END PROCESS;
       
       PROCESS(NUM)
       BEGIN
           IF NUM = x"20" THEN
                rom<= (x"04", x"0a", x"11", x"11", x"1f", x"11", x"11",x"00");   -- x"41 A
           ELSIF NUM = x"21" THEN
                rom<= (x"1e", x"11", x"11", x"1e", x"11", x"11", x"1e",x"00");   -- x"42 B
           ELSIF NUM = x"22" THEN
                rom<= (x"0e", x"11", x"10", x"10", x"10", x"11", x"0e",x"00");   -- x"43 C
           ELSIF NUM = x"23" THEN
                rom<= (x"1e", x"09", x"09", x"09", x"09", x"09", x"1e",x"00");   -- x"44 D
           ELSIF NUM = x"24" THEN
                rom<= (x"1f", x"10", x"10", x"1c", x"10", x"10", x"1f",x"00");   -- x"45", E
           ELSIF NUM = x"25" THEN
                rom<= (x"1f", x"10", x"10", x"1f", x"10", x"10", x"10",x"00");   -- x"46 F
           ELSIF NUM = x"26" THEN
                rom<= (x"0e", x"11", x"10", x"10", x"13", x"11", x"0f",x"00");   -- x"37 G
           ELSIF NUM = x"27" THEN
                rom<= (x"11", x"11", x"11", x"1f", x"11", x"11", x"11",x"00");   -- x"48 H
           ELSIF NUM = x"28" THEN
                rom<= (x"0e", x"04", x"04", x"04", x"04", x"04", x"0e",x"00");   -- x"49 I
           ELSIF NUM = x"29" THEN
                rom<= (x"1f", x"02", x"02", x"02", x"02", x"12", x"0c",x"00");   -- x"4a J
           ELSIF NUM = x"2A" THEN
                rom<= (x"11", x"12", x"14", x"18", x"14", x"12", x"11",x"00");   -- x"4b K
           ELSIF NUM = x"2B" THEN
                rom<= (x"10", x"10", x"10", x"10", x"10", x"10", x"1f",x"00");   -- x"4c L
           ELSIF NUM = x"2C" THEN
                rom<= (x"11", x"1b", x"15", x"11", x"11", x"11", x"11",x"00");   -- x"4d M
           ELSIF NUM = x"2D" THEN
                rom<= (x"11", x"11", x"19", x"15", x"13", x"11", x"11",x"00");   -- x"4e N
           ELSIF NUM = x"2E" THEN
                rom<= (x"0e", x"11", x"11", x"11", x"11", x"11", x"0e",x"00");   -- x"4f O
           ELSIF NUM = x"2F" THEN
                rom<= (x"1e", x"11", x"11", x"1e", x"10", x"10", x"10",x"00");   -- x"50 P
           ELSIF NUM = x"30" THEN
                rom<= (x"0e", x"11", x"11", x"11", x"15", x"12", x"0d",x"00");   -- x"51 Q 
           ELSIF NUM = x"31" THEN
                rom<= (x"1e", x"11", x"11", x"1e", x"14", x"12", x"11",x"00");   -- x"52 R
           ELSIF NUM = x"32" THEN
                rom<= (x"0e", x"11", x"10", x"0e", x"01", x"11", x"0e",x"00");   -- x"53 S
           ELSIF NUM = x"33" THEN
                rom<= (x"1f", x"04", x"04", x"04", x"04", x"04", x"04",x"00");   -- x"54 T
           ELSIF NUM = x"34" THEN
                rom<= (x"11", x"11", x"11", x"11", x"11", x"11", x"0e",x"00");   -- x"55 U
           ELSIF NUM = x"35" THEN
                rom<= (x"11", x"11", x"11", x"11", x"11", x"0a", x"04",x"00");   -- x"56 V
           ELSIF NUM = x"36" THEN
                rom<= (x"11", x"11", x"11", x"15", x"15", x"1b", x"11",x"00");   -- x"57 W
           ELSIF NUM = x"37" THEN
                rom<= (x"11", x"11", x"0a", x"04", x"0a", x"11", x"11",x"00");   -- x"58 X
           ELSIF NUM = x"38" THEN
                rom<= (x"11", x"11", x"0a", x"04", x"04", x"04", x"04",x"00");   -- x"59 Y
           ELSIF NUM = x"39" THEN
                rom<= (x"1f", x"01", x"02", x"04", x"08", x"10", x"1f",x"00");   -- x"5a Z       
          ELSE 
                rom<= (x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00");  
       END IF;
       END PROCESS;
       
             ----- Upper section of FSM: --------------------
       PROCESS (pr_state)
       BEGIN
            CASE pr_state IS
                   WHEN S0 =>
                             dot<=rom(0);
                             an <= "01111111";
                             nx_state <= S1;
                   WHEN S1 =>
                             dot<=rom(1);
                             an <= "10111111";
                             nx_state <= S2;
                   WHEN S2 =>
                             dot<=rom(2);
                             an <= "11011111";
                             nx_state <= S3;
                   WHEN S3 =>
                             dot<=rom(3);
                             an <= "11101111";
                             nx_state <= S4;
                   WHEN S4 =>
                             dot<=rom(4);
                             an <= "11110111";
                             nx_state <= S5;
                   WHEN S5 =>
                             dot<=rom(5);
                             an <= "11111011";
                             nx_state <= S6;
                   WHEN S6 =>
                             dot<=rom(6);
                             an <= "11111101";
                             nx_state <= S7;
                   WHEN S7 =>
                             dot<=rom(7);
                              an <= "11111110";
                             nx_state <= S0;
              END CASE;
       END PROCESS;
END ASCII_5x7_font;