@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Tue Jun 08 21:35:47 +0900 2021
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto e673abf4ed924f239fedc304ed50a7a6 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot TB_modulo6_Up_Down_behav xil_defaultlib.TB_modulo6_Up_Down -log elaborate.log"
call xelab  -wto e673abf4ed924f239fedc304ed50a7a6 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot TB_modulo6_Up_Down_behav xil_defaultlib.TB_modulo6_Up_Down -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
