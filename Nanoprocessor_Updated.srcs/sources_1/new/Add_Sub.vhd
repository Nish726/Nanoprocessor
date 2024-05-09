----------------------------------------------------------------------------------
-- Company: Code Busters
-- Engineer: 
-- 
-- Create Date: 04/25/2024 12:22:19 PM
-- Design Name: 
-- Module Name: Add_Sub - Behavioral
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

entity Add_sub is
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 B : in STD_LOGIC_VECTOR (3 downto 0);
 Sub_EN : in STD_LOGIC;
 Com_EN : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (3 downto 0);
 Overflow : out STD_LOGIC;
 Zero_flag : out STD_LOGIC);
end Add_sub;

architecture Behavioral of Add_sub is
component FA is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 C_in : in STD_LOGIC;
 S : out STD_LOGIC;
 C_out : out STD_LOGIC);
end component;

SIGNAL FA0_C, FA1_C, FA2_C, FA3_C: STD_LOGIC;
SIGNAL XOR_OUT,S_out : STD_LOGIC_VECTOR (3 downto 0);

begin

XOR_OUT(0) <= B(0) XOR Sub_EN; 
XOR_OUT(1) <= B(1) XOR Sub_EN; 
XOR_OUT(2) <= B(2) XOR Sub_EN; 
XOR_OUT(3) <= B(3) XOR Sub_EN; 

FA_0 : FA
 port map (
 A => A(0),
 B => XOR_OUT(0),
 C_in => Sub_EN,
 S => S_out(0),
 C_Out => FA0_C);
 
FA_1 : FA
 port map (
 A => A(1),
 B => XOR_OUT(1),
 C_in => FA0_C,
 S => S_out(1),
 C_Out => FA1_C);
 
FA_2 : FA
 port map (
 A => A(2),
 B => XOR_OUT(2),
 C_in => FA1_C,
 S => S_out(2),
 C_Out => FA2_C);
 
FA_3 : FA
 port map (
 A =>A(3),
 B => XOR_OUT(3),
 C_in => FA2_C,
 S => S_out(3),
 C_Out => FA3_C);
 
S(0)<=S_out(0);
S(1)<=S_out(1);
S(2)<=S_out(2);
S(3)<=S_out(3);

Zero_flag <= NOT(Com_EN) AND NOT(S_out(0) OR S_out(1) OR S_out(2) OR S_out(3)) AND ((A(0) OR B(0)) OR (A(1) OR B(1)) OR (A(2) OR B(2)) OR (A(3) OR B(3)));
Overflow<= NOT(Com_EN) AND (FA3_C XOR FA2_C);

end Behavioral;
