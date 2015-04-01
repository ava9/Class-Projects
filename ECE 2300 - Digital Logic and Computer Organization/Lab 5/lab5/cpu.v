module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  //reg [7:0] PC;
  //reg [7:0] NextPC;
  
  //reg MW;
  
  
  
  // ADD YOUR CODE BELOW THIS LINE
  
  wire [7:0] programCounter;
  wire [7:0] programCounterNext;
  
  wire [2:0] DR;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMMO;
  wire MB;
  wire [2:0] FS;
  wire MD;
  wire LD;
  wire MW;
  
  wire [7:0] D_in;
  wire [7:0] DataAWire;
  wire [7:0] DataBWire;
  
  wire [7:0] aluOutput;
  wire C;
  wire V;
  wire N;
  wire Z;
  
  // Extended immediate value
  wire [7:0] IMME;
  
  wire HALT_INSTRUCTION;
  wire HALT_OUTPUT;
  wire [5:0] OFFSET;
  wire [2:0] BRANCH_SELECT;
  
  assign PC = programCounter;
  assign NextPC = programCounterNext;
  assign D_in = (MD == 1'b0 ? aluOutput : Din);
  assign DataA = DataAWire;
  assign DataB = DataBWire;
  assign DataC = D_in;
  assign DataD = aluOutput;
  
  ProgramCounter pc(
      .CLK(CLK),
      .RESET(RESET),
      .H(HALT_OUTPUT),
    
      .PC(programCounter),
      .PC_NEXT(programCounterNext),
		.BS(BRANCH_SELECT),
		.OFF(OFFSET),
		.N(N),
		.Z(Z)
      );
  
  Decoder decoder(
      .INSTR(Iin),
    
      .DR(DR),
      .SA(SA),
      .SB(SB),
      .IMMO(IMMO),
      .MB(MB),
      .FS(FS),
      .MD(MD),
      .LD(LD),
      .MW(MW),
      .HALT(HALT_INSTRUCTION),
		.BS(BRANCH_SELECT),
		.OFF(OFFSET)
      );
	
	HaltLogic haltlogic(
	   .CLK(CLK),
		.RESET(RESET),
		.HALT(HALT_INSTRUCTION),
		.EN_L(EN_L),
		.H(HALT_OUTPUT)
	);
  
  RegFile file(
      .CLK(CLK),
      .RESET(RESET),
      .SA(SA),
      .SB(SB),
      .LD(LD),
      .DR(DR),
      .D_in(D_in),
      .DataA(DataAWire),
      .DataB(DataBWire)
      );
  
  SignExtend extend(
      .IMM(IMMO),
      .OUTPUT(IMME)
      );
  
  alu lulu(
      .A(DataAWire),
      .B((MB == 1'b0 ? DataBWire : IMME)),
      .OP(FS),
      .Y(aluOutput),
      .C(C),
      .V(V),
      .N(N),
      .Z(Z)
      );
      
  
  // ADD YOUR CODE ABOVE THIS LINE

endmodule