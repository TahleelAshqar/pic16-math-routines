# PIC16 Math Routines

This project contains low-level assembly routines for the PIC16 family of microcontrollers.

## ✳️ Features

- 8-bit × 8-bit multiplication using registers `0x40` and `0x41`
- 16-bit result stored in `0x42:0x43`
- Binary to BCD (Binary Coded Decimal) conversion routine
- BCD result stored in `0x61:0x62:0x63`

## 🛠 Technologies

- Assembly language for PIC16 (MPLAB / MPASM)
- Low-level bitwise and arithmetic operations
- Status register flag handling (carry, zero, etc.)

## ▶️ How to Use

1. Open the `.asm` file in MPLAB (or your PIC development environment).
2. Assemble the code and load it to a PIC16 microcontroller or simulator.
3. Set the input values in the specified registers.
4. Run the program and inspect the result registers (`0x42:0x43` or `0x61:0x63`).

## 📚 Notes

These routines were written as part of an academic assignment to practice:
- Register-level programming
- Arithmetic in assembly
- Number representation and conversion (binary ↔ BCD)
