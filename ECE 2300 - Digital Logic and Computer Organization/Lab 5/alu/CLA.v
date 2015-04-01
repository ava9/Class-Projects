module CLA(
	input CI,
	input [3:0] A,
	input [3:0] B,
	
	output [2:0] S,
	output CO
);

wire [3:0] G;
wire [3:0] P;
wire [2:0] C;

assign S[3:0] = A[3:0] ^ B[3:0];
assign G[3:0] = A[3:0] & B[3:0];
assign P[3:0] = A[3:0] | B[3:0];

assign C[0] = G[0] | (P[0] & CI);
assign C[2:1] = G[2:1] | (P[2:1] & C[1:0]);
assign CO = G[3] | (P[3] & C[2]);
endmodule