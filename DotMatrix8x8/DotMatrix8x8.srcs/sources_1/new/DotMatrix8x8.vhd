----------------------------------------------------------------
--| Design file name: dot_matrix.vhd
----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;

entity dot_matrix is 
        GENERIC (clk_divider: INTEGER := 6000);    --12MHz to 500Hz
        port ( rst, clk :   in std_logic;
                 an :   out bit_vector(7 downto 0);
                 dot:   out bit_vector(7 downto 0)   );
end dot_matrix;

-------------------------------------------------------------------
ARCHITECTURE dot_matrix OF dot_matrix IS
       TYPE state IS (S0, S1, S2, S3, S4, S5, S6, S7);
       SIGNAL pr_state, nx_state: state;
       signal     E: bit;

      TYPE memory IS ARRAY (0 TO 7) of bit_vector(7 DOWNTO 0);
      CONSTANT rom: memory := (
             "00110000", "01111000", "01111100", "00111110", "00111110", "01111100", "01111000" ,"00110000"   ); --heart
--           "01111100", "10000010", "10000010", "10000010", "01111100", "00000000",  --0 
--           "11111110", "10010000", "10011000", "10010100", "01100010", "00000000",  --R
--           "11111110", "10010010", "10010010", "10010010", "10010010", "00000000",  --E
--           "00111110", "01010000", "10010000", "01010000", "00111110", "00000000",  --A
BEGIN
       ----- Clock generator (E->500Hz): -------------
       PROCESS (clk)
              VARIABLE count: INTEGER RANGE 0 TO clk_divider;
       BEGIN
              IF (clk'EVENT AND clk='1') THEN
                   count := count + 1;
                   IF (count=clk_divider) THEN
                           E <= NOT E;
                           count := 0;
                  END IF;
              END IF;
       END PROCESS;
----- Lower section of FSM: --------------------
      PROCESS (E)
      BEGIN
             IF (E'EVENT AND E='1') THEN
                  IF (rst='1') THEN
                       pr_state <= S0;
                 ELSE
                       pr_state <= nx_state;
                 END IF;
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
END dot_matrix;