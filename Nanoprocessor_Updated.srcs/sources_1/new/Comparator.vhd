----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 08:14:33 PM
-- Design Name: 
-- Module Name: Comparator - Behavioral
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
entity Comparator is
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 B : in STD_LOGIC_VECTOR (3 downto 0);
 Com_EN : in STD_LOGIC;
 Low : out STD_LOGIC;
 High : out STD_LOGIC;
 Equal : out STD_LOGIC);
end Comparator;

architecture Behavioral of Comparator is
begin
    process(A, B, Com_EN)
    begin
        if Com_EN = '1' then
            if A = B then
                Equal <= '1';
                Low <= '0';
                High <= '0';
            elsif A > B then  
                Low <= '0';
                High <= '1';
                Equal <= '0';
            else
                Low <= '1';
                High <= '0';
                Equal <= '0';
            end if;
        else
            Low <= '0';
            High <= '0';
            Equal <= '0';
        end if;
    end process;
end Behavioral;
