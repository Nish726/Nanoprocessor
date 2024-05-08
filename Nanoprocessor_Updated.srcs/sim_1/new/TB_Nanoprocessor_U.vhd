----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 03:41:54 PM
-- Design Name: 
-- Module Name: TB_Nanoprocessor_U - Behavioral
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
entity TB_Nanoprocessor is
-- Port ( );
end TB_Nanoprocessor;
architecture Behavioral of TB_Nanoprocessor is
component Nanoprocessor is
 Port ( Clk : in STD_LOGIC;
 Reset : in STD_LOGIC;
 LED_out : out STD_LOGIC_VECTOR (3 downto 0);
 S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
 Anode : out STD_LOGIC_VECTOR (3 downto 0);
 Overflow : out STD_LOGIC;
 Zero_flag : out STD_LOGIC;
 Low : out STD_LOGIC;
 High : out STD_LOGIC;
 Equal : out STD_LOGIC);
end component;

signal Clk : STD_LOGIC :='0';
signal Reset : STD_LOGIC;
signal LED_out : STD_LOGIC_VECTOR (3 downto 0);
signal S_7seg : STD_LOGIC_VECTOR (6 downto 0);
signal Anode : STD_LOGIC_VECTOR (3 downto 0);
signal Overflow, Zero_flag, Low, High, Equal  : STD_LOGIC;
begin
UUT : Nanoprocessor
 port map (
 Clk => Clk,
 Reset => Reset,
 LED_out => LED_out,
 S_7seg => S_7seg,
 Anode => Anode,
 Overflow =>Overflow,
 Zero_flag =>Zero_flag,
 Low => Low,
 High => High,
 Equal => Equal);
 
process begin
 wait for 10 ns;
 Clk<= not Clk;
end process;
process begin
 Reset <= '1';
 wait for 300 ns;
 Reset <= '0';
 wait; 
end process;
end Behavioral;
