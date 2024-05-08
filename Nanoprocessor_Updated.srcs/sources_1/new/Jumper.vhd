----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 10:35:08 PM
-- Design Name: 
-- Module Name: Jumper - Behavioral
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

entity Jumper is
  Port (
  Jmp_check : in STD_LOGIC_VECTOR (3 downto 0); 
  Jmp_on : in STD_LOGIC;
  Jmp_Flag: out STD_LOGIC );
end Jumper;

architecture Behavioral of Jumper is

begin
process(Jmp_on, Jmp_check) 
begin
    if Jmp_check = "0000" AND Jmp_on = '1' then
        Jmp_Flag <= '1';
    else
         Jmp_Flag <= '0';
end if;
end process;
end Behavioral;