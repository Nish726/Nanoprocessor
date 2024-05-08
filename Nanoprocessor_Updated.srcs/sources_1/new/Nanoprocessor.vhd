----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 12:17:43 AM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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
entity Nanoprocessor is
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
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

component Slow_Clk is
 Port ( Clk_in : in STD_LOGIC;
 Clk_out : out STD_LOGIC);
end component;

component ROM is
 Port ( 
 Clk : in STD_LOGIC;
 Address : in STD_LOGIC_VECTOR (2 downto 0);
 Data : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component Program_Counter is
 Port ( Clk : in STD_LOGIC;
 Reset : in STD_LOGIC;
 Jmp_Flag: in STD_LOGIC;
 D : in STD_LOGIC_VECTOR (2 downto 0);
 Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Ins_Decoder is
 Port (
 Ins : in STD_LOGIC_VECTOR (12 downto 0); 
 Reg_En, MuxA_Sel, MuxB_Sel, Jmp_Addr : out STD_LOGIC_VECTOR(2 downto 0);
 Load_Sel, Sub_Sel, Jmp_on, Com_EN: out STD_LOGIC;
 Im_Val : out STD_LOGIC_VECTOR (3 downto 0) );
end component;

component MUX_2x3 is
    Port ( 
        A : in STD_LOGIC_VECTOR (2 downto 0);   
        B : in STD_LOGIC_VECTOR (2 downto 0);   
        S : in STD_LOGIC;                       
        Z : out STD_LOGIC_VECTOR (2 downto 0)   
    );
end component;
component MUX_2x4 is
    Port ( 
    A : in STD_LOGIC_VECTOR (3 downto 0);   
    B : in STD_LOGIC_VECTOR (3 downto 0);   
    S : in STD_LOGIC;                       
    Z : out STD_LOGIC_VECTOR (3 downto 0)   
);
end component;
 
component MUX_8x4 is
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
end component;
 
component Adder_3_bit is
 Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
 B : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (2 downto 0));
end component;
 
 component Add_sub is
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
  B : in STD_LOGIC_VECTOR (3 downto 0);
  Sub_EN : in STD_LOGIC;
  Com_EN : in STD_LOGIC;
  S : out STD_LOGIC_VECTOR (3 downto 0);
  Overflow : out STD_LOGIC;
  Zero_flag : out STD_LOGIC);
 end component;
 
 component Reg_Bank is
  Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
  Clk : in STD_LOGIC;
  Reset : in STD_LOGIC;
  Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
  R0 : out STD_LOGIC_VECTOR (3 downto 0);
  R1 : out STD_LOGIC_VECTOR (3 downto 0);
  R2 : out STD_LOGIC_VECTOR (3 downto 0);
  R3 : out STD_LOGIC_VECTOR (3 downto 0);
  R4 : out STD_LOGIC_VECTOR (3 downto 0);
  R5 : out STD_LOGIC_VECTOR (3 downto 0);
  R6 : out STD_LOGIC_VECTOR (3 downto 0);
  R7 : out STD_LOGIC_VECTOR (3 downto 0));
 end component;
 
 component LUT_16_7 is
  Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
  data : out STD_LOGIC_VECTOR (6 downto 0));
 end component;
 
 component Comparator is
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
  B : in STD_LOGIC_VECTOR (3 downto 0);
  Com_EN : in STD_LOGIC;
  Low : out STD_LOGIC;
    High : out STD_LOGIC;
    Equal : out STD_LOGIC);
   end component;
   
   component Jumper is
     Port (
     Jmp_check : in STD_LOGIC_VECTOR (3 downto 0); 
     Jmp_on : in STD_LOGIC;
     Jmp_Flag: out STD_LOGIC );
   end component;
   
   signal Clk_signal, Load_Sel, Sub_En, Com_EN, Jmp_Flag, Jmp_on : STD_LOGIC;
   signal ROM_In, PC_In, Reg_En, MuxA_enable, MuxB_enable, Jmp_Addr, Adder_3bit_out : STD_LOGIC_VECTOR(2 downto 0);
   signal Im_Val, MuxA_out, MuxB_out, AU_out, Data_in_Bus, Jmp_check_out, R0_out, R1_out, R2_out, R3_out, R4_out, R5_out, R6_out, R7_out : STD_LOGIC_VECTOR(3 downto 0);
   signal Ins_Bus : STD_LOGIC_VECTOR (12 downto 0);
   
   begin
   Slow_Clk_0 : Slow_Clk
    port map (
    Clk_in => Clk,
    Clk_out => Clk_signal);
    
   PC_0: Program_Counter
     Port map( 
     Clk => Clk_signal,
     Reset =>Reset,
     Jmp_Flag => Jmp_Flag,
     D => PC_In,
     Q => ROM_In);
    
   ROM_0 : ROM 
    port map (
    Clk => Clk_signal,
    Address => ROM_In,
    Data => Ins_Bus);
    
   Ins_Decoder_0 : Ins_Decoder
    Port map(
    Ins => Ins_Bus,
    Reg_En => Reg_En,
    MuxA_Sel => MuxA_enable, 
    MuxB_Sel => MuxB_enable, 
    Jmp_Addr =>Jmp_Addr,
    Load_Sel => Load_Sel,
    Sub_Sel => Sub_En,
    Jmp_on => Jmp_on,
    Com_EN => Com_EN,
    Im_Val => Im_val);
    
   Data_select_Mux: MUX_2x4
    Port map( 
    A => AU_out, 
    B => Im_Val,
    S => Load_Sel,
    Z => Data_in_Bus);
    
   Reg_bank0 :Reg_Bank
    Port map ( 
    D => Data_in_Bus,
    Clk => Clk_signal,
    Reset => Reset,
    Reg_En => Reg_En,
    R0 => R0_out,
    R1 => R1_out,
    R2 => R2_out,
    R3 => R3_out,
    R4 => R4_out,
    R5 => R5_out,
    R6 => R6_out,
    R7 => R7_out);
    
   MuxA : MUX_8x4
    Port map ( 
    R0 => R0_out,
    R1 => R1_out,
    R2 => R2_out,
    R3 => R3_out,
    R4 => R4_out,
    R5 => R5_out,
    R6 => R6_out,
    R7 => R7_out,
    s => MuxA_enable,
    z => MuxA_out);
    
   MuxB : MUX_8x4
    Port map ( 
    R0 => R0_out,
    R1 => R1_out,
    R2 => R2_out,
    R3 => R3_out,
    R4 => R4_out,
    R5 => R5_out,
    R6 => R6_out,
    R7 => R7_out,
    s => MuxB_enable,
    z => MuxB_out);
    
   AU : Add_sub
    Port map( 
    A => MuxA_out,
    B => MuxB_out,
    Sub_EN => Sub_En,
    Com_EN => Com_EN,
    S => AU_out,
    Overflow => Overflow,
    Zero_flag => Zero_flag);
    
   Adder_3bit : Adder_3_bit
    Port map (
    A => ROM_In,
    B => '1',
    S => Adder_3bit_out);
   
    Jumper_0 :Jumper
     Port map( 
     Jmp_check => MuxA_out,
     Jmp_on => Jmp_on,
     Jmp_Flag => Jmp_Flag);
      
   Addr_Sel_Mux :MUX_2x3
    Port map( 
    A => Adder_3bit_out,
    B => Jmp_Addr,
    S => Jmp_Flag,
    Z => PC_In);
      
     LUT_16_7_0 : LUT_16_7
      port map(
      address=>R7_out,
      data=>S_7seg);
    
     COM : Comparator
      Port map( 
      A => MuxA_out,
      B => MuxB_out,
      Com_EN => Com_EN,
      Low => Low,
      High => High,
      Equal => Equal); 
    
     LED_out <= R7_out;
     Anode <= "1110";
     end Behavioral;