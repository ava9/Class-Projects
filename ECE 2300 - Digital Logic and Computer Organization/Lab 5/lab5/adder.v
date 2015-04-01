module adder(A, B, CI, Y, CO, V, N, Z); // add all inputs and outputs inside parentheses

  // inputs
  input	[7:0]	A;
  input	[7:0]	B;
  input			CI;	
  // outputs
  output [7:0] Y;
  output CO;
  output V;
  output N;
  output Z;
  
  // reg and internal variable definitions
  wire [7:0] G;
  wire [7:0] P;
  wire [8:0] C;

  // implement module here
  
  // One-adder carry-look ahead
  assign Y[7:0] = A[7:0] ^ B[7:0] ^ C[7:0];
  assign G[7:0] = A[7:0] & B[7:0];
  assign P[7:0] = A[7:0] | B[7:0];

  assign C[0] = CI;
  assign C[8:1] = G[7:0] | (P[7:0] & C[7:0]);
  assign CO = C[8];
  assign V = C[8] != C[7] ? 1'b1 : 1'b0;
  assign N = Y[7] == 1'b1 ? 1'b1 : 1'b0;
  assign Z = Y[7:0] == 8'b00000000 ? 1'b1 : 1'b0;
  
endmodule