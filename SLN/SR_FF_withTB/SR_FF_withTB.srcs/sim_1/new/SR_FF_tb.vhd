library IEEE;
use IEEE.std_logic_1164.all;
entity SY_RSFF_TEST is
end SY_RSFF_TEST;

architecture SY_RSFF_TEST of SY_RSFF_TEST is
    component RS_FF
        port ( R, S, CLK : in std_logic;
               Q, Q_B :out std_logic);
    end component;
    constant STEP : time := 100ns;
    signal   CLK, R, S : std_logic;
    signal   Q, Q_B : std_logic;
    
  begin
  U0:RS_FF port map(R=>R, S => S, CLK => CLK,
                      Q => Q, Q_B => Q_B );
  process
  begin
             CLK <= '0';
    wait for STEP / 2; CLK <= '1';
    wait for STEP / 2;
  end process;
  process
  begin
                         R <= '0'; S <= '0';
   wait for STEP *4 / 3; R <= '1';
   wait for STEP    / 2; R <= '0';
   wait for STEP    / 2; S <= '1';
   wait for STEP;        R <= '1';
   wait for STEP /2;     S <= '0';
   wait for STEP;        R <= '0';
   wait;
  end process;
end SY_RSFF_TEST;