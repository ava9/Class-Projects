module ProgramCounter(CLK, RESET, H, PC, PC_NEXT, BS, N, Z, OFF);
  input CLK;
  input RESET;
  input H;
  input [2:0] BS;
  input N;
  input Z;
  input [5:0] OFF;
    
  output [7:0] PC;
  output [7:0] PC_NEXT;
    
  reg [7:0] PC;
  
  wire MP;  
  assign MP = (BS == 3'b000 ? Z : (BS == 3'b001 ? ~Z : (BS == 3'b010 ? ~N : (BS == 3'b011 ? N : 1'b0))));
  
  wire [7:0] OFFE;
  assign OFFE[0] = 1'b0;
  assign OFFE[6:1] = OFF[5:0];
  assign OFFE[7] = OFF[5];
  
  assign PC_NEXT = PC + (H == 1'b1 ? 8'b00000000 : (8'b00000010 + (MP == 1'b1 ? OFFE : 8'b00000000)));
   
    // Only update PC on clock update
  always @(posedge CLK) begin
    // If RESET is asserted, set counter to 0, otherwise if the program counter 
    //is halted, set counter to itself (no change), otherwise set counter 
    //to next value
    PC <= RESET ? 8'b00000000 : PC_NEXT;
  end
    
endmodule