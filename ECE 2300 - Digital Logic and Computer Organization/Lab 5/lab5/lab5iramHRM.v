module lab5iramHRM(CLK, RESET, ADDR, Q);
  input         CLK;
  input         RESET;
  input  [7:0]  ADDR;
  output [15:0] Q;

  reg    [15:0] mem[0:127]; // instruction memory with 16 bit entries

  wire   [6:0]  saddr;
  integer       i;


  assign saddr = ADDR[7:1];
  assign Q = mem[saddr];

  always @(posedge CLK) begin
    if(RESET) begin
      mem[0]   <= 16'b1111000000000001;   // SUB  R0, R0, R0
      mem[1]   <= 16'b1111010010010001;   // SUB  R2, R2, R2
      mem[2]   <= 16'b1111111111111001;   // SUB  R7, R7, R7
      mem[3]   <= 16'b1111110110110001;   // SUB  R6, R6, R6
      mem[4]   <= 16'b0101000101111111;   // ADDI R5, R0, -1
      mem[5]   <= 16'b1111101000101011;   // SRL  R5, R5
      mem[6]   <= 16'b0010000011111001;   // LB   R3, -7(R0)
      mem[7]   <= 16'b0110011011000001;   // ANDI R3, R3,  1
      mem[8]   <= 16'b0010000100111001;   // LB   R4, -7(R0)
      mem[9]   <= 16'b0110100100000001;   // ANDI R4, R4, 1
      mem[10]  <= 16'b1111100011011000;   // ADD  R3, R4, R3
      mem[11]  <= 16'b0110011011000001;   // ANDI R3, R3, 1
      mem[12]  <= 16'b1111010011010000;   // ADD  R2, R2, R3
      mem[13]  <= 16'b1111100000011000;   // ADD  R3, R4, R0
      mem[14]  <= 16'b0101111111111111;   // ADDI R7, R7, -1
      mem[15]  <= 16'b1001111000111000;   // BNE  R7, R0, -8
      mem[16]  <= 16'b0101110110111111;   // ADDI R6, R6, -1
      mem[17]  <= 16'b1001110000110110;   // BNE  R6, R0, -10
      mem[18]  <= 16'b0101101101111111;   // ADDI R5, R5, -1
      mem[19]  <= 16'b1001101000110100;   // BNE  R5, R0, -12 
      mem[20]  <= 16'b0101010100100010;   // ADDI R4, R2, -30
      mem[21]  <= 16'b1011100000000001;   // BLTZ R4, 1
      mem[22]  <= 16'b0101000010011101;   // ADDI R2, R0, 29
      mem[23]  <= 16'b1111010000010100;   // SLL  R2, R2
      // 0(R2) is tens/ones
      // 1(R2) is hundreds
      mem[24]  <= 16'b0010010011000000;   // LB   R3, 0(R2) // R3 is now tens/ones
      mem[25]  <= 16'b0100000011111110;   // SB   R3, -2(R0) 
      mem[26]  <= 16'b0010010011000001;   // LB   R3, 1(R2) // R3 is now hundreds
      mem[27]  <= 16'b0100000011111111;   // SB   R3, -1(R0)

      mem[28] <= 16'b0010010001000001; // LB R1, 1(R2) // R1 <= hundreds
      mem[29] <= 16'b0101000011000000; // ADDI R3, R0, 0 // R3 <= 0
      mem[30] <= 16'b1000011001000110; // BEQ R1, R3, 6 // If hundreds digit is 0, branch to X
      mem[31] <= 16'b0101000011000001; // ADDI R3, R0, 1 // R3 <= 1
      mem[32] <= 16'b1000011001000100; // BEQ R1, R3, 4 // If hundreds digit is 1, branch to X
      mem[33] <= 16'b0101000001111111; // ADDI R1, R0, 255 // R1 <= 255
      mem[34] <= 16'b0100000001111010; // SB R1, -6(R0) // Mem[250] <= 255
      mem[35] <= 16'b0100000001111011; // SB R1, -5(R0) // Mem[251] <= 255
      mem[36] <= 16'b1000000000111111; // BEQ R0, R0, 127 // Go to end of instruction RAM
		//X
      mem[37] <= 16'b0010010011000001; // LB R3, 1(R2) // R3 <= hundreds digit of heart rate, either 1 or 0
      mem[38] <= 16'b0101000001011100; // ADDI R1, R0, -100 // R1 <= -100
      //Y
		mem[39] <= 16'b0101001001100100; // ADDI R1, R1, 100 // R1 += R1
      mem[40] <= 16'b0101011011111111; // ADDI R3, R3, -1 // R3 -= 1
      mem[41] <= 16'b1001000011111101; // BNE R3, R0, -3 // Go to Y if R3 != 0
		// Now R1 == 100 or 0
      mem[42] <= 16'b0010010011000000; // LB R3, 0(R2) // Get combined 10s + 1s of display
      mem[43] <= 16'b1111011000011011; // SRL R3, R3 // Extract value of 10s place and put into R3
      mem[44] <= 16'b1111011000011011; // SRL R3, R3 // Extract value of 10s place and put into R3
      mem[45] <= 16'b1111011000011011; // SRL R3, R3 // Extract value of 10s place and put into R3
      mem[46] <= 16'b1111011000011011; // SRL R3, R3 // Extract value of 10s place and put into R3
		//Z
      mem[47] <= 16'b0101001001001010; // ADDI R1, R1, 10 // R1 += 10;
      mem[48] <= 16'b0101011011111111; // ADDI R3, R3, -1 // R3 -= 1
      mem[49] <= 16'b1001001011111101; // BNE R3, R1, -3 // Go to Z if R3 != 0
      mem[50] <= 16'b0101001001001110; // ADDI R1, R1, -50 // Subtract 50 (1 is value of heart rate ignoring the 1s)
      // Light up 1 LED
    mem[51] <= 16'b0010000100111010; // LB R4, -6(R0) // R4 <= left 8 LEDS
      mem[52] <= 16'b0101000101111111; // ADDI R5, R0, 255
      mem[53] <= 16'b1000101100000100; // BEQ R4, R5, 4
    // Light up light in FIRST byte
    // If here, know that not all first lights are lit
    // Know that number lights lit = R4
      mem[54] <= 16'b1111100000100100; // SLL R4, R4
      mem[55] <= 16'b0101001100000001; // ADDI R4, R1, 1
      mem[56] <= 16'b0100000100111010; // SB R4, -6(R0)
      mem[57] <= 16'b1000000000000101; // BEQ R0, R0, 5 //END OF SUBROUTINE
    // A -> Light up light in SECOND byte
      mem[58] <= 16'b0010000100111011; // LB R4, -5(R0)
      mem[59] <= 16'b1111100000100100; // SLL R4, R4
      mem[60] <= 16'b0101001100000001; // ADDI R4, R1, 1
      mem[61] <= 16'b0100000100111011; // SB R4, -5(R0)
      mem[62] <= 16'b1000000000000000; // BEQ R0, R0, 0 // END OF SUBROUTINE
    mem[63] <= 16'b0010010001000000; // LB R1, 0(R2) // R1 <= ones digit of heart rate
    
    // Now 1 LED is lit and 50 has been subtracted
    // Subtract 10 from R1 and save into different register
    // If < 0, skip to rounding step
    // Subtract 10
    // Light up LED
    // unconditional branch back to subtract 10...
    
       mem[64] <= 16'b0101001011110110; // ADDI R3, R1, -10
     mem[65] <= 16'b1011011000010000; // BLTZ R3, 16
     mem[66] <= 16'b0101011011110110; // ADDI R3, R3, -10
    // Light up 1 LED
     mem[67] <= 16'b0010000100111010; // LB R4, -6(R0) // R4 <= left 8 LEDS
       mem[68] <= 16'b0101000101111111; // ADDI R5, R0, 255
       mem[69] <= 16'b1000101100000100; // BEQ R4, R5, 4
    // Light up light in FIRST byte
    // If here, know that not all first lights are lit
    // Know that number lights lit = R4
       mem[70] <= 16'b1111100000100100; // SLL R4, R4
       mem[71] <= 16'b0101001100000001; // ADDI R4, R1, 1
       mem[72] <= 16'b0100000100111010; // SB R4, -6(R0)
       mem[73] <= 16'b1000000000000101; // BEQ R0, R0, 5 // END OF SUBROUTINE
    // A -> ;light up light in SECOND byte
       mem[74] <= 16'b0010000100111011; // LB R4, -5(R0)
       mem[75] <= 16'b1111100000100100; // SLL R4, R4
       mem[76] <= 16'b0101001100000001; // ADDI R4, R1, 1
       mem[77] <= 16'b0100000100111011; // SB R4, -5(R0)
       mem[78] <= 16'b1000000000000000; // BEQ R0, R0, 0 //END OF SUBROUTINE
     mem[79] <= 16'b0010010001000000; // LB R1, 0(R2) // R1 <= ones digit of heart rate
     mem[80] <= 16'b1000000000110000; // BEQ R0, R0, -16
     
     //Rounding Part
     
     mem[81] <= 16'b0010010011000000; // LB R3, 0(R2) // Get combined 10s + 1s of display
     mem[82] <= 16'b0110011011001111; // ANDI R3, R3, 15
     mem[83] <= 16'b0101011011111011; // ADDI R3, R3, -5
     mem[84] <= 16'b1011011000101100; // BLTZ R3, 44
     // Light up 1 LED
     mem[85] <= 16'b0010000100111010; // LB R4, -6(R0) // R4 <= left 8 LEDS
       mem[86] <= 16'b0101000101111111; // ADDI R5, R0, 255
       mem[87] <= 16'b1000101100000100; // BEQ R4, R5, 4
    // Light up light in FIRST byte
    // If here, know that not all first lights are lit
    // Know that number lights lit = R4
       mem[88] <= 16'b1111100000100100; // SLL R4, R4
       mem[89] <= 16'b0101001100000001; // ADDI R4, R1, 1
       mem[90] <= 16'b0100000100111010; // SB R4, -6(R0)
       mem[91] <= 16'b1000000000000101; // BEQ R0, R0, 5 // END OF SUBROUTINE
    // A -> Light up light in SECOND byte
       mem[92] <= 16'b0010000100111011; // LB R4, -5(R0)
       mem[93] <= 16'b1111100000100100; // SLL R4, R4
       mem[94] <= 16'b0101001100000001; // ADDI R4, R1, 1
       mem[95] <= 16'b0100000100111011; // SB R4, -5(R0)
       mem[96] <= 16'b1000000000000000; // BEQ R0, R0, 0 //END OF SUBROUTINE
		 
		// OFFSET VALUE
      for(i = 95; i < 128; i = i + 1) begin
        mem[i] <= 16'b0000000000000000;
      end
    end
  end

endmodule
