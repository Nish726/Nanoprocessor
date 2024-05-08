----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 02:59:42 PM
-- Design Name: 
-- Module Name: MUX_8x4 - Behavioral
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

entity MUX_8x4 is
    Port ( 
        R0 : in STD_LOGIC_VECTOR (3 downto 0);   
        R1 : in STD_LOGIC_VECTOR (3 downto 0);   
        R2 : in STD_LOGIC_VECTOR (3 downto 0);  
        R3 : in STD_LOGIC_VECTOR (3 downto 0);   
        R4 : in STD_LOGIC_VECTOR (3 downto 0);   
        R5 : in STD_LOGIC_VECTOR (3 downto 0);   
        R6 : in STD_LOGIC_VECTOR (3 downto 0);   
        R7 : in STD_LOGIC_VECTOR (3 downto 0);   
        S : in STD_LOGIC_VECTOR (2 downto 0);    
        Z : out STD_LOGIC_VECTOR (3 downto 0)    
    );
end MUX_8x4;

architecture Behavioral of MUX_8x4 is
begin
    Z <= R0 when S = "000" else
         R1 when S = "001" else
         R2 when S = "010" else
         R3 when S = "011" else
         R4 when S = "100" else
         R5 when S = "101" else
         R6 when S = "110" else
         R7;  
end Behavioral;