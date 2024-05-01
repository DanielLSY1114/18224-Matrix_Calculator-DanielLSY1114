# Matrix Calculator

Siyuan Li
18-224 Spring 2024 Final Tapeout Project

## Overview

This project is a 4 by 4 matrix calculator. It can perform multiplication, addition, and subtraction. The element of input matrix is 4 bit.

## How it Works

Each number of the matrix is 4 bit. During each of the inputs, the 8 bit data will be two elements of the full matrix, and hit input enter.

The sequence of entering elements is shown below.

  Matrix 1       Matrix 2 
  
00 00 01 01    08 08 09 09

02 02 03 03    10 10 11 11

04 04 05 05    12 12 13 13

06 06 07 07    14 14 15 15

During entering the last two element of the second matrix, the calculation sign will also need to be selected. 00 is multiplication. 01 is addition. 10 is subtraction. 11 is an undefined behavior, which will raise an error flag in output.

Because 4 by 4 matrix with 4 bit element can result with 4 by 4 matrix with 10 bit element, the output will display the matrix element one by one, part by part. After finishing the calculation, the finish signal will be high, and the 5 bit output will be the higher 5 bit of the first element of result. Hitting the output change button, the output will switch to the lower 5 bit of the first element. Hitting the change button again, the output will switch to the higher 5 bit of the second element.

The 4 index indicator will show which element is showing right now. The index of the element is shown below.

0000 0001 0010 0011

0100 0101 0110 0111

1000 1001 1010 1011

1100 1101 1110 1111

The multiplication of whole matrix will be accomplished with 17 cycles. The multiplication of each element will be accomplished with two cycles. The first cycle will do the multiplication of corresponding elements, and the second cycle will add the corresponding element.

The addition and subtraction will be accomplished with 16 cycles. In each cycle, one element of result will be calculated.

## Inputs/Outputs

(describe what each of the 12 input and 12 output pins are used for; )

(if you have any specific dependency on clock frequency; i.e. for visual effects or for an external interface, explain it here.)

## Hardware Peripherals

(if you have any external hardware peripherals such as buttons, LEDs, sensors, etc, please explain them here. otherwise, remove this section)

## Design Testing / Bringup

(explain how to test your design; if relevant, give examples of inputs and expected outputs)

(if you would like your design to be tested after integration but before tapeout, provide a Python script that uses the Debug Interface posted on canvas and explain here how to run the testing script)

## Media

(optionally include any photos or videos of your design in action)

## (anything else)

If there is anything else you would like to document about your project such as background information, design space exploration, future ideas, verification details, references, etc etc. please add it here. This template is meant to be a guideline, not an exact format that you're required to follow.
