# Nanoprocessor

![Improved nano](https://github.com/AkinduH/Nanoprocessor/assets/164672047/e8c23c0e-201e-457c-af8d-99f745724181)

A simplified 4-bit nanoprocessor is designed to run on the Basys3 FPGA. It's developed using Xilinx Vivado with VHDL. The nanoprocessor consists of Registers, an Add/Sub Unit, Decoders, and Multiplexers, each implemented separately. This setup allows for basic math operations such as addition, subtraction, and comparison. Additionally, the design can halt processes once an instruction set completes a cycle, enabling us to clearly view the final output.

![image](https://github.com/AkinduH/Nanoprocessor/assets/164672047/59c45145-339b-4e26-94e3-af9617c2ea3d)
 
Instructions are hardcoded into the ROM and loaded at runtime. The sample program continuously subtracts 2 from 10 and compares the values until 10 reaches 0. The result is then mapped for display on the FPGA's 7-segment display. The timing diagram of the program's simulation is shown below.

![TB](https://github.com/AkinduH/Nanoprocessor/assets/164672047/983a612a-feea-4313-b8fd-2cbd806462e4)
