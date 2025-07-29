#  Nand2Tetris: Hack Computer Implementation

This project is a full implementation of the **Hack Computer Hardware and Assembler**  using the [Nand2Tetris course](https://www.nand2tetris.org/) as a guide.


 Built from logic gates all the way to a 16-bit computer  
 Assembler in C   
 Contains `.v` verilog files  , `.asm` hack machine language files , `.c` assembler , `.hack` binary conversion of `.asm` files 

---


##  Hack Computer Design

This project builds up from NAND gates to a fully functional computer.

###  ALU Design

Performs arithmetic and logic operations:

![ALU](https://github.com/anujk2004/nandtotetris/blob/main/images/alu.png)

---

###  CPU and Memory
Screen & RAM16 have the same internal logic or input/output interface, but are instantiated with different memory addresses.
While keyboard is just Reading and not writing.
| CPU | Memory |
|-----|--------|
|CPU (Toplevel) ![CPU](https://github.com/anujk2004/nandtotetris/blob/main/images/cputop.png) | ![Memory](https://github.com/anujk2004/nandtotetris/blob/main/images/mem.png) |
|CPU (Implementaion)  ![CPU](https://github.com/anujk2004/nandtotetris/blob/main/images/insidecpu.png)|RAM16 ![Memory](https://github.com/anujk2004/nandtotetris/blob/main/images/RAM16.png) |

---

###  Complete Hack Computer

Integration of CPU, Memory, and Instruction:


![Computer](https://github.com/anujk2004/nandtotetris/blob/main/images/hackcompdesign.png?raw=true)

My RTL Schematic

![Computer](https://github.com/anujk2004/nandtotetris/blob/main/images/hack_comp_top.png?raw=true)
![Computer](https://github.com/anujk2004/nandtotetris/blob/main/images/hack_comp_expanded.png?raw=true)
---

##  Assembler

The `assembler/` directory contains a basic assembler written in C.
The assembler first reads from the `.asm` files and writes the binary value to `.hack` file.


- Translates A and C instructions
- Produces `.hack` binary file (`output.hack`)
- Label handling (e.g., `(LOOP)`) 
- Variable symbols (e.g., `@i`, `@sum`)

###  Note:
Each `check` test case has two versions:
- One with labels and symbols (e.g., `check2_max.asm`  with output file as  `outputmax.hack`)
- One without labels/symbols (e.g., `check2max_labels.asm`with output file as  `outputmaxL.hack`)  
 **Both produce the same binary output** and validate assembler correctness.




### Assembler Logic:
A instruction![Assembler Logic](https://github.com/anujk2004/nandtotetris/blob/main/images/Ainstruct.png)
C instruction![Assembler Logic](https://github.com/anujk2004/nandtotetris/blob/main/images/Cinstruct.png)
Predefined Symbols ![Assembler Logic](https://github.com/anujk2004/nandtotetris/blob/main/images/predefinedsymb.png)
---
## Additional Components

This repository also includes:

- **All project modules** created during the weekly assignments of Nand2Tetris Part I
- **Basic Components**: dmux, NOT, OR16
- **Memory hierarchy**:
  - `RAM8`
  - `RAM64`
  - `RAM512`
  - `RAM4K`
  - `RAM16K`

All foundational modules are reused in the final Hack Computer.

---





