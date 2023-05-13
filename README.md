# Optimized-8-bit-pipelined-multiplier
This code demonstrates a pipelined multiplier design, which leverages parallelism to achieve high performance. 

It utilizes a four-stage pipeline to compute the product of two 8-bit numbers (a and b). 

The multiplier is designed to be efficient and optimized for speed. 


Stage 0: Initialization and input capture
- a_reg and b_reg are loaded with the values of a and b, respectively.
- The stage is updated to 1.


Stage 1: Partial Product 1 calculation
- The result is loaded with partial_product1, which is the product of the least significant bit of a (a_reg[0]) and b.
- The stage is updated to 2.


Stage 2: Partial Product 2 calculation
- The result is updated by adding partial_product2, which is the product of the second bit of a (a_reg[1]) and b, shifted left by 1.
- The stage is updated to 3.


Stage 3: Partial Product 3 calculation
- The result is updated by adding partial_product3, which is the product of the third bit of a (a_reg[2]) and b, shifted left by 2.
- The stage is updated to 4.


Stage 4: Partial Product 4 calculation and final result
- The result is updated by adding partial_product4, which is the product of the fourth bit of a (a_reg[3]) and b, shifted left by 3.
- The stage is reset back to 0.
