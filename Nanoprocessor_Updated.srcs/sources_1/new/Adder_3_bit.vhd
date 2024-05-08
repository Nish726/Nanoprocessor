----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 01:54:27 PM
-- Design Name: 
-- Module Name: Adder_3_bit - Behavioral
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
entity Adder_3_bit is
 Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
 B : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3_bit;

architecture Behavioral of Adder_3_bit is
component HA is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 S : out STD_LOGIC;
 C : out STD_LOGIC);
end component;

SIGNAL HA0_C, HA1_C, HA2_C: STD_LOGIC;

begin
HA0 : HA PORT MAP (A=>A(0), B=>'1', S=>S(0), C=>HA0_C);
HA1 : HA PORT MAP (A=>A(1), B=>HA0_C, S=>S(1), C=>HA1_C);
HA2 : HA PORT MAP (A=>A(2), B=>HA1_C, S=>S(2), C=>HA2_C);
end Behavioral;
