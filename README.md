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
### Program Counter

The **Hack computer** does not explicitly use an `inc` (increment) input for its program counter in the final design.

To address different use cases, this repository includes **two versions of the Program Counter**:

1. **Standard PC (Used in Hack Computer):**  
   - Matches the original Hack specification  
   - Automatically increments unless `load` or `reset` is active  
   - No explicit `inc` input  
   

2. **Extended PC (in `RAMs_reg_pc/`):**  
   - Contains an explicit `inc` input  
   - Enables controlled incrementing externally

![PC](https://github.com/anujk2004/nandtotetris/blob/main/images/pc.png)

---
###  CPU , Memory & ROM32K
`Screen` & `RAM16K` have the same internal logic or input/output interface, but are instantiated with different memory addresses. The `Keyboard` module is `read-only`.
| CPU | Memory |ROM32K
|-----|--------|-----|
|CPU (Toplevel) ![CPU](https://github.com/anujk2004/nandtotetris/blob/main/images/cputop.png) | ![Memory](https://github.com/anujk2004/nandtotetris/blob/main/images/mem.png) |![ROM32K](https://github.com/anujk2004/nandtotetris/blob/main/images/ROM32.png)
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
-   `One bit REG`
-   `Eight bit REG`
  - `RAM8`
  - `RAM64`
  - `RAM512`
  - `RAM4K`
  - `RAM16K`

All foundational modules are reused in the final Hack Computer.

---





