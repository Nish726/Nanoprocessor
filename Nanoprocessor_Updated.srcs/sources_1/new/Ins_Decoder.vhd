----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 08:56:21 PM
-- Design Name: 
-- Module Name: Ins_Decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ins_Decoder is
 Port (
 Ins : in STD_LOGIC_VECTOR (12 downto 0);
 Reg_En, MuxA_Sel, MuxB_Sel, Jmp_Addr : out STD_LOGIC_VECTOR(2 downto 0);
 Load_Sel, Sub_Sel, Jmp_on, Com_EN: out STD_LOGIC;
 Im_Val : out STD_LOGIC_VECTOR (3 downto 0) );
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is

signal K : STD_LOGIC_VECTOR (12 downto 0);
signal I : STD_LOGIC_VECTOR (2 downto 0);

begin
K <= Ins;
I <= Ins (12 downto 10);

process (K) 
begin

if I = "001" then -- MOVI R_In, d
 Reg_En <= Ins (9 downto 7);
 Im_Val <= Ins (3 downto 0);
 Load_Sel <= '1';
 Com_En <= '0'; 
 MuxA_Sel <= "000";
 MuxB_Sel <= "000";
 Sub_Sel <= '0';
 Jmp_on <= '0';
-- Jmp_Addr <= "UUU";
 
elsif I = "011" then -- ADD Ra, Rb 
 MuxA_Sel <= Ins (9 downto 7);
 MuxB_Sel <= Ins (6 downto 4);
 Sub_Sel <= '0'; -- adding 
 Load_Sel <= '0';
 Reg_En <= Ins (9 downto 7);
-- Im_Val <= "UUUU";
 Com_En <= '0'; 
 Jmp_on <= '0';
-- Jmp_Addr <= "UUU";

elsif I = "100" then -- SUB Ra, Rb 
 MuxA_Sel <= Ins (9 downto 7);
 MuxB_Sel <= Ins (6 downto 4);
 Sub_Sel <= '1'; -- substract 
 Load_Sel <= '0';
 Reg_En <= Ins (9 downto 7);
-- Im_Val <= "UUUU";
 Com_En <= '0'; 
 Jmp_on <= '0';
-- Jmp_Addr <= "UUU";

elsif I = "010" then -- NEG R_In
 MuxA_Sel <= "000"; -- register 0 has value 0
 MuxB_Sel <= Ins (9 downto 7);
 Sub_Sel <= '1';
 Load_Sel <= '0';
 Reg_En <= Ins (9 downto 7);
-- Im_Val <= "UUUU";
 Com_En <= '0';
 Jmp_on <= '0';
-- Jmp_Addr <= "UUU"; 
 
elsif I = "101" then -- JZR R_In, d 
 Jmp_on <= '1';
 Jmp_Addr <= Ins (2 downto 0);
 Reg_En <= Ins (9 downto 7);
 Load_Sel <= '0';
-- Im_Val <= "UUUU";
 Com_En <= '0';
 MuxA_Sel <= Ins (9 downto 7); 
 MuxB_Sel <= "000";
 Sub_Sel <= '0';
 
elsif I = "110" then -- COM Ra, Rb 
  MuxA_Sel <= Ins (9 downto 7);
  MuxB_Sel <= Ins (6 downto 4);
  Im_Val <= "0000";
  Sub_Sel <= '0'; 
  Load_Sel <= '1';
  Reg_En <= "000";
  Com_EN <= '1'; 
  Jmp_on <= '0';
 -- Jmp_Addr <= "UUU";
 
elsif I = "000" then -- NULL
 Reg_En <= "000";
 Im_Val <= "0000";
 Load_Sel <= '1';
 Com_En <= '0'; 
 MuxA_Sel <= "000";
 MuxB_Sel <= "000";
 Sub_Sel <= '0';
 Jmp_on <= '0';
-- Jmp_Addr <= "UUU";
 
end if;
end process;
end Behavioral;