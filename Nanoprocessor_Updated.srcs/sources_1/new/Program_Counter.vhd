----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 04:58:10 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
 Port ( Clk : in STD_LOGIC;
 Reset : in STD_LOGIC;
 Jmp_Flag: in STD_LOGIC;
 D : in STD_LOGIC_VECTOR (2 downto 0);
 Q : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

signal max_reached : STD_LOGIC := '0'; -- Add this signal

begin
process (clk) begin 
if Reset = '1' then
    Q <= "000";
    max_reached <= '0'; -- Reset the signal when Reset is '1'
elsif (rising_edge(Clk)) then
        if max_reached = '0' then -- Only update Q if max_reached is '0'
            Q <= D; 
            if D = "111" then -- If D has reached its maximum value
                max_reached <= '1'; -- Set max_reached to '1'
        end if;
        end if; 
end if;
end process;
end Behavioral;







