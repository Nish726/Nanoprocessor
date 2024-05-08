----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 11:39:46 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.numeric_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity ROM is
 Port ( 
 Clk : in STD_LOGIC;
 Address : in STD_LOGIC_VECTOR (2 downto 0);
 Data : out STD_LOGIC_VECTOR (12 downto 0));
end ROM;
architecture Behavioral of ROM is
type rom_type is array(0 to 7) of std_logic_vector(12 downto 0);
signal ROM : rom_type := (
------------------ Operations -----------------------------
"0011110001010", -- MOVI R7, 10
"0010100000010", -- MOVI R2, 2
"1001110100000", --- SUB R7,R2
"1101110100000", -- COM R7, R2
"1011110000111", --- JZR R7,7
"1010000000010", --- JZR R0,2
"0000000000000", -- NULL
"0000000000000" -- NULL
);

signal prev_Address : STD_LOGIC_VECTOR (2 downto 0) := "111"; -- signal to store the previous Address

begin
process (Clk,Address) 
begin
if rising_edge(Clk) then 
    if Address = prev_Address then
        -- If the current Address is the same as the previous one, output the specific instruction
        Data <= "0000000000000"; -- NULL
    else
        -- If it's not, proceed with the normal operation
        Data <= ROM(to_integer(unsigned(Address)));
    end if;

    -- At the end of the process block, update the previous Address signal with the current one
    prev_Address <= Address;
end if;
end process;
end Behavioral;