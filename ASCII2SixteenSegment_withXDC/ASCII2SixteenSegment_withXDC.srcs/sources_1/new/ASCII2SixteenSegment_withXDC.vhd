-------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;
-------------------------------------------------

ENTITY counter IS
   GENERIC( clk_divider: INTEGER := 6000000); -- 12MHz to 1Hz
   
   PORT ( clk, rst: IN STD_LOGIC ;
          E: buffer bit ;
          f: out std_logic_vector(15 DOWNTO 0);
          count: INOUT STD_LOGIC_VECTOR (4 DOWNTO 0) );
END counter;
-------------------------------------------------

ARCHITECTURE hex_2_16seg OF counter IS
   TYPE state IS (aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, as, at, au,
                   av, aw, ax, ay, az, ba, bb, bc, bd, be, bf);
   SIGNAL pr_state, nx_state: state;
   TYPE memory IS ARRAY (0 TO 31) of std_logic_vector(15 DOWNTO 0);
    CONSTANT rom: memory := ("0001000010110111","0000110000111111","0000001110101101","0011000011111111","0000001111101101","0011000001111111","0011110001111111","0010000010111111",
                                "1100110000111111","0011001111101101","1100000111111111","1111110001110011","1111000011111111","1100110011010111","1100110011011011","0001110000111111",
                                "0000000011111011","0001110000111011","0010001000111111","0011111111101101","1100000011111111","1111110011110110","1100110011111010","1111111111010010",
                                "1101111000111101","0011001111110110","1011011111101101","1111111111011011","0111101111101101","1111111111111010","1111001111111111","0000000011111111");
BEGIN
-------------- clock generation ----
process(clk)
    variable count: integer range 0 to clk_divider;
    begin
        if(clk'event and clk='1') then
           count := count + 1;
           if( count= clk_divider) then 
                E <= NOT E;
                count := 0;
           end if;
        end if;
end process;

------------- Lower section: -----------------
PROCESS (rst, E)
BEGIN
   IF (rst='1') THEN
      pr_state <= aa;
   ELSIF (E'EVENT AND E='1') THEN
      pr_state <= nx_state;
   END IF;
END PROCESS;

------------- Upper section: -----------------
PROCESS (pr_state)
BEGIN
   CASE pr_state IS
      WHEN aa =>
         count <= "00000";
         f <= rom(0);
         nx_state <= ab;
      WHEN ab =>
         count <= "00001";
         f <= rom(1);
         nx_state <= ac;
      WHEN ac =>
         count <= "00010";
         f <= rom(2);
         nx_state <= ad;
      WHEN ad =>
         count <= "00011";
         f <= rom(3);
         nx_state <= ae;
      WHEN ae =>
         count <= "00100";
         f <= rom(4);
         nx_state <= af;         
      WHEN af =>
         count <= "00101";
         f <= rom(5);
         nx_state <= ag;   
      WHEN ag =>
         count <= "00110";
         f <= rom(6);
         nx_state <= ah;
      WHEN ah =>
         count <= "00111";
         f <= rom(7);
         nx_state <= ai;
      WHEN ai =>
         count <= "01000";
         f <= rom(8);
         nx_state <= aj;
      WHEN aj =>
         count <= "01001";
         f <= rom(9);
         nx_state <= ak;
      WHEN ak =>
         count <= "01010";
         f <= rom(10);
         nx_state <= al;
      WHEN al =>
         count <= "01011";
         f <= rom(11);
         nx_state <= am;
      WHEN am =>
         count <= "01100";
         f <= rom(12);
         nx_state <= an;
      WHEN an =>
         count <= "01101";
         f <= rom(13);
         nx_state <= ao;         
      WHEN ao =>
         count <= "01110";
         f <= rom(14);
         nx_state <= ap;  
      WHEN aq =>
         count <= "10000";
         f <= rom(15);
         nx_state <= ar;                        
      WHEN ar =>
         count <= "10001";
         f <= rom(16);
         nx_state <= as; 
      WHEN as =>
         count <= "10010";
         f <= rom(17);
         nx_state <= at;         
      WHEN at =>
         count <= "10011";
         f <= rom(18);
         nx_state <= au;         
      WHEN au =>
         count <= "10100";
         f <= rom(19);
         nx_state <= av;
      WHEN av =>
         count <= "10101";
         f <= rom(20);
         nx_state <= aw;         
      WHEN aw =>
         count <= "10110";
         f <= rom(21);
         nx_state <= ax;         
      WHEN ax =>
         count <= "10111";
         f <= rom(22);
         nx_state <= ay;         
      WHEN ay =>
         count <= "11000";
         f <= rom(23);
         nx_state <= az;
      WHEN az =>
         count <= "11001";
         f <= rom(24);
         nx_state <= ba;         
      WHEN ba =>
         count <= "11010";
         f <= rom(25);
         nx_state <= bb;          
      WHEN bb =>
         count <= "11011";
         f <= rom(26);
         nx_state <= bc;
      WHEN bc =>
         count <= "11100";
         f <= rom(27);
         nx_state <= bd;         
      WHEN bd =>
         count <= "11101";
         f <= rom(28);
         nx_state <= be;         
      WHEN be =>
         count <= "11110";
         f <= rom(29);
         nx_state <= bf;         
      WHEN bf =>
         count <= "11111";
         f <= rom(30);
         nx_state <= aa;         
      WHEN ap =>
         count <= "01111";
         f <= rom(31);
         nx_state <= aq;                                                                                      
     END CASE;
    END PROCESS;
END ARCHITECTURE hex_2_16seg;