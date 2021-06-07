## This file is a general .xdc for the Cmod S7-25 Rev. B
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## 12 MHz System Clock
set_property -dict { PACKAGE_PIN M9    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L13P_T2_MRCC_14 Sch=gclk
#create_clock -add -name sys_clk_pin -period 83.33 -waveform {0 41.66} [get_ports { clk }];

## Push Buttons
set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { rst }]; #IO_L6P_T0_34 Sch=btn[0]
#set_property -dict { PACKAGE_PIN D1    IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]; #IO_L6N_T0_VREF_34 Sch=btn[1]

## RGB LEDs
#set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { led0_b }]; #IO_L10N_T1_34 Sch=led0_b
#set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { led0_g }]; #IO_L9N_T1_DQS_34 Sch=led0_g
#set_property -dict { PACKAGE_PIN F2    IOSTANDARD LVCMOS33 } [get_ports { led0_r }]; #IO_L10P_T1_34 Sch=led0_r

## 4 LEDs
set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { count[4] }]; #IO_L8P_T1_34 Sch=led[1]
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { count[3] }]; #IO_L16P_T2_34 Sch=led[2]
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { count[2] }]; #IO_L16N_T2_34 Sch=led[3]
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { count[1] }]; #IO_L8N_T1_34 Sch=led[4]
set_property -dict { PACKAGE_PIN M4    IOSTANDARD LVCMOS33 } [get_ports { count[0] }]; #IO_L8N_T1_34 Sch=led[5]


## Dedicated Digital I/O on the PIO Header
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { E }]; #IO_L18N_T2_34 Sch=pio[01]
set_property -dict { PACKAGE_PIN M3    IOSTANDARD LVCMOS33 } [get_ports { f[15] }]; #IO_L19N_T3_VREF_34 Sch=pio[03] --segment num1~
set_property -dict { PACKAGE_PIN N2    IOSTANDARD LVCMOS33 } [get_ports { f[14] }]; #IO_L20P_T3_34 Sch=pio[04]      --segment num2
set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports { f[13] }]; #IO_L20N_T3_34 Sch=pio[05]
set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports { f[12] }]; #IO_L21P_T3_DQS_34 Sch=pio[06]
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { f[11] }]; #IO_L21N_T3_DQS_34 Sch=pio[07]
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { f[10] }]; #IO_L22P_T3_34 Sch=pio[08]
set_property -dict { PACKAGE_PIN N1    IOSTANDARD LVCMOS33 } [get_ports { f[9] }]; #IO_L22N_T3_34 Sch=pio[09]
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { f[8] }]; #IO_L5P_T0_34 Sch=pio[40]
set_property -dict { PACKAGE_PIN A2    IOSTANDARD LVCMOS33 } [get_ports { f[7] }]; #IO_L2N_T0_34 Sch=pio[41]
set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { f[6] }]; #IO_L2P_T0_34 Sch=pio[42]
set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { f[5] }]; #IO_L4N_T0_34 Sch=pio[43]
set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { f[4] }]; #IO_L4P_T0_34 Sch=pio[44]
set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { f[3] }]; #IO_L3N_T0_DQS_34 Sch=pio[45]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { f[2] }]; #IO_L3P_T0_DQS_34 Sch=pio[46]
set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { f[1] }]; #IO_L1N_T0_34 Sch=pio[47]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { f[0] }]; #IO_L1P_T0_34 Sch=pio[48]


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]