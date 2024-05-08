----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 11:47:48 PM
-- Design Name: 
-- Module Name: Reg_without_FF - Behavioral
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
entity Reg_without_FF is
 Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
 En : in STD_LOGIC;
 Reset : in STD_LOGIC;
 Clk : in STD_LOGIC;
 Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_without_FF;
architecture Behavioral of Reg_without_FF is
begin
process (Clk) 
begin 
 if Reset = '1' then
 Q <= "0000";
 elsif (rising_edge(Clk)) AND En = '1'  then 
 Q <= D;
 end if;
end process;
end Behavioral;
