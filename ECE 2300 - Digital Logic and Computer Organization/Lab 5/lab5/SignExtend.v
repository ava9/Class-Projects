module SignExtend(
    input [5:0] IMM,
    output [7:0] OUTPUT
    );
  
  assign OUTPUT[5:0] = IMM[5:0];
  assign OUTPUT[6] = IMM[5];
  assign OUTPUT[7] = IMM[5];
  
endmodule