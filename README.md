# Nanoprocessor

![Improved nano](https://github.com/AkinduH/Nanoprocessor/assets/164672047/e8c23c0e-201e-457c-af8d-99f745724181)

A simplified 4-bit nanoprocessor is designed to run on the Basys3 FPGA. It's developed using Xilinx Vivado with VHDL. The nanoprocessor consists of Registers, an Add/Sub Unit, Decoders, and Multiplexers, each implemented separately. This setup allows for basic math operations such as addition, subtraction, and comparison. Additionally, the design can halt processes once an instruction set completes a cycle, enabling us to clearly view the final output.

![image](https://github.com/AkinduH/Nanoprocessor/assets/164672047/59c45145-339b-4e26-94e3-af9617c2ea3d)
 
Instructions are hardcoded into the ROM and loaded at runtime. The sample program continuously subtracts 2 from 10 and compares the values until 10 reaches 0. The result is then mapped for display on the FPGA's 7-segment display. The timing diagram of the program's simulation is shown below.

![TB](https://github.com/AkinduH/Nanoprocessor/assets/164672047/983a612a-feea-4313-b8fd-2cbd806462e4)

We ran the simulation using the following instructions stored in the ROM:

- ----------------- Operations -----------------------------
"0011110001010", -- MOVI R7, 10

"0010100000010", -- MOVI R2, 2

"1001110100000", --- SUB R7,R2

"1101110100000", -- COM R7, R2

"1011110000111", --- JZR R7,7

"1010000000010", --- JZR R0,2

"0000000000000", -- NULL
"0000000000000" -- NULL
