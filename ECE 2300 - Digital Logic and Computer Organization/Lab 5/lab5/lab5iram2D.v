module lab5iram2D(CLK, RESET, ADDR, Q);
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
      mem[0]   <= 16'b1111000000000001;   // SUB R0, R0, R0
      mem[1]   <= 16'b0010000001111000;   // LB R1, -8(R0)
      mem[2]   <= 16'b0010000010111001;   // LB R2, -7(R0)
      mem[3]   <= 16'b0110001001001111;   // ANDI R1, R1, 15
      mem[4]   <= 16'b0110010010001111;   // ANDI R2, R2, 15
      mem[5]   <= 16'b0100000001001010;   // SB R1, 10(R0)
      mem[6]   <= 16'b0101000100000000;   // ADDI R4, R0, 0
      mem[7]   <= 16'b0101001011111111;   // ADDI R3, R1, -1
      mem[8]   <= 16'b1111001100100000;   // ADD R4, R1, R4
      mem[9]   <= 16'b0101011011111111;   // ADDI R3, R3, -1
      mem[10]  <= 16'b1010011000111101;   // BGEZ R3, -3
      mem[11]  <= 16'b0100000100111110;   // SB R4, -2(R0)
      mem[12]  <= 16'b0101000101000000;   // ADDI R5, R0, 0
      mem[13]  <= 16'b0101010011111111;   // ADDI R3, R2, -1
      mem[14]  <= 16'b1111010101101000;   // ADD R5, R2, R5
      mem[15]  <= 16'b0101011011111111;   // ADDI R3, R3, -1
      mem[16]  <= 16'b1010011000111101;   // BGEZ R3, -3
      mem[17]  <= 16'b0100000101111101;   // SB R5, -3(R0)
      mem[18]  <= 16'b1111100101110000;   // ADD R6, R4, R5
      mem[19]  <= 16'b0101000001000000;   // ADDI R1, R0, 0
      mem[20]  <= 16'b1000001110001000;   // BEQ R1, R6, 8
      mem[21]  <= 16'b0101000111000000;   // ADDI R7, R0, 0
      mem[22]  <= 16'b0101000011000001;   // ADDI R3, R0, 1
      mem[23]  <= 16'b1111111011111000;   // ADD R7, R7, R3
      mem[24]  <= 16'b0101011011000010;   // ADDI R3, R3, 2
      mem[25]  <= 16'b0101001001000001;   // ADDI R1, R1, 1
      mem[26]  <= 16'b1000111110000010;   // BEQ R7, R6, 2
      mem[27]  <= 16'b1001111000111011;   // BNE R7, R0, -5
      mem[28]  <= 16'b0101000001111111;   // ADDI R1, R0, -1
      mem[29]  <= 16'b0100000001111111;   // SB R1, -1(R0)
      mem[30]  <= 16'b0000000000000001;   // HALT
      mem[31]  <= 16'b0010000001001010;   // LB R1, 10(R0)
      mem[32]  <= 16'b1111100101110001;   // SUB R6, R4, R5
      mem[33]  <= 16'b1111001010111001;   // SUB R7, R1, R2
      mem[34]  <= 16'b1010111000000001;   // BGEZ R7, 1
      mem[35]  <= 16'b1111000110110001;   // SUB R6, R0, R6
      mem[36]  <= 16'b0101000001000000;   // ADDI R1, R0, 0
      mem[37]  <= 16'b1000001110001000;   // BEQ R1, R6, 8
      mem[38]  <= 16'b0101000111000000;   // ADDI R7, R0, 0
      mem[39]  <= 16'b0101000011000001;   // ADDI R3, R0, 1
      mem[40]  <= 16'b1111111011111000;   // ADD R7, R7, R3
      mem[41]  <= 16'b0101011011000010;   // ADDI R3, R3, 2
      mem[42]  <= 16'b0101001001000001;   // ADDI R1, R1, 1
      mem[43]  <= 16'b1000111110000010;   // BEQ R7, R6, 2
      mem[44]  <= 16'b1001111000111011;   // BNE R7, R0, -5
      mem[45]  <= 16'b0101000001111111;   // ADDI R1, R0, -1
      mem[46]  <= 16'b0100000001111111;   // SB R1, -1(R0)
      mem[47]  <= 16'b0000000000000001;   // HALT

      for(i = 48; i < 128; i = i + 1) begin
        mem[i] <= 16'b0000000000000000;
      end
    end
  end

endmodule
