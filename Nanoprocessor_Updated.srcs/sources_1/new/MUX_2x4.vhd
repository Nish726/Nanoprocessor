----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 02:49:56 PM
-- Design Name: 
-- Module Name: MUX_2x4 - Behavioral
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

entity MUX_2x4 is
    Port ( 
    A : in STD_LOGIC_VECTOR (3 downto 0);   
    B : in STD_LOGIC_VECTOR (3 downto 0);   
    S : in STD_LOGIC;                       
    Z : out STD_LOGIC_VECTOR (3 downto 0)   
);
end MUX_2x4;

architecture Behavioral of MUX_2x4 is

begin
    Z <= A when S = '0' else B;  
    
end Behavioral;
