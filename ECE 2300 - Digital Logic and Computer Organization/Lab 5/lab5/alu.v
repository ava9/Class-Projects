module alu(A, B, OP, Y, C, V, N, Z, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;
  output [6:0]  HEX7;
  output [6:0]  HEX6;
  output [6:0]  HEX5;
  output [6:0]  HEX4;
  output [6:0]  HEX3;
  output [6:0]  HEX2;
  output [6:0]  HEX1;
  output [6:0]  HEX0;



  // ADD YOUR CODE BELOW THIS LINE
  parameter ADD = 3'b000;
  parameter SUB = 3'b001;
  parameter SRA = 3'b010;
  parameter SRL = 3'b011;
  parameter SLL = 3'b100;
  parameter AND = 3'b101;
  parameter  OR = 3'b110;
  
  wire logicalC;
  wire logicalV;
  wire logicalN;
  wire logicalZ;
  
  wire shiftC;
  wire shiftV;
  wire shiftN;
  wire shiftZ;
  
  wire adderC;
  wire adderV;
  wire adderN;
  wire adderZ;
  
  wire LOGIC_OPERATION;
  wire SHIFT_DIRECTION;
  wire SHIFT_TYPE;
  
  wire [7:0] LOGICAL_Y;
  wire [7:0] SHIFT_Y;
  wire [7:0] ADDER_Y;
  
  wire [1:0] OUTPUT_SELECT;
  
  wire BSEL;
  wire CISEL;
  // Carries result from B select to adder
  wire [7:0] adderB;
  
  wire adderCI;
  
  
  control freak(
    .OP(OP),
	 .A(A),
	 .B(B),
	 .BSEL(BSEL),
	 .CISEL(CISEL),
	 .OSEL(OUTPUT_SELECT),
	 .SHIFT_LA(SHIFT_TYPE),
	 .SHIFT_LR(SHIFT_DIRECTION),
	 .LOGICAL_OP(LOGIC_OPERATION)
  );
  
  muxO muxO(
	.OSEL(OUTPUT_SELECT),
	.Oout(Y),
	.shifterResult(SHIFT_Y),
	.logicalResult(LOGICAL_Y),
	.adderResult(ADDER_Y)
  );

  logical paradox(
    .A(A),
	 .B(B),
	 .OP(LOGIC_OPERATION),
	 .Y(LOGICAL_Y),
	 .C(logicalC),
	 .V(logicalV),
	 .N(logicalN),
	 .Z(logicalZ)
  );  
  
  shifter iDontGiveAShift(
    .A(A),
	 .LA(SHIFT_TYPE),
	 .LR(SHIFT_DIRECTION),
	 .Y(SHIFT_Y),
	 .C(shiftC),
	 .V(shiftV),
	 .N(shiftN),
	 .Z(shiftZ)
  );
  
  muxB muxB(
	.BSEL(BSEL),
	.Bout(adderB),
	.BInput(B)
  );
  
  muxCI muxCI(
	.CISEL(CISEL),
	.CIout(adderCI)
  );
  
  adder snake(
	.A(A),
	.B(adderB),
	.CI(adderCI),
	
	.Y(ADDER_Y),
	.CO(adderC),
	.V(adderV),
	.N(adderN),
	.Z(adderZ)
	);
  
  assign C = (OP == AND || OP == OR) ? logicalC : (OP == SRA || OP == SRL || OP == SLL) ? shiftC : adderC;
  assign V = (OP == AND || OP == OR) ? logicalV : (OP == SRA || OP == SRL || OP == SLL) ? shiftV : adderV;
  assign N = (OP == AND || OP == OR) ? logicalN : (OP == SRA || OP == SRL || OP == SLL) ? shiftN : adderN;
  assign Z = (OP == AND || OP == OR) ? logicalZ : (OP == SRA || OP == SRL || OP == SLL) ? shiftZ : adderZ;
  

  // ADD YOUR CODE ABOVE THIS LINE



  // SEVEN-SEGMENT DISPLAY DRIVERS

  // replace unused segments with code to disable display
  assign HEX5 = 7'b1111111;
  assign HEX4 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX2 = 7'b1111111;
  assign HEX1 = 7'b1111111;
  assign HEX0 = 7'b1111111;

  hex_to_seven_seg upperBitsOfY(
    .B(Y[7:4]),
    .SSEG_L(HEX7)
  );

  hex_to_seven_seg lowerBitsOfY(
    .B(Y[3:0]),
    .SSEG_L(HEX6)
  );

endmodule