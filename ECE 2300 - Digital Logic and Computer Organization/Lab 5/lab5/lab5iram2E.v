module lab5iram2E(CLK, RESET, ADDR, Q);
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
      mem[2]   <= 16'b0101000010000000;   // ADDI R2, R0, 0
      mem[3]   <= 16'b1111111111111001;   // SUB R7, R7, R7
      mem[4]   <= 16'b1000001000001111;   // BEQ R1, R0, 15
      mem[5]   <= 16'b0101000111000001;   // ADDI R7, R0, 1
      mem[6]   <= 16'b0101000011000011;   // ADDI R3, R0, 3
      mem[7]   <= 16'b0101000010000001;   // ADDI R2, R0, 1
      mem[8]   <= 16'b1000111001001011;   // BEQ R7, R1, 11
      mem[9]   <= 16'b1111001111100001;   // SUB R4, R1, R7
      mem[10]  <= 16'b0101100100000001;   // ADDI R4, R4, 1
      mem[11]  <= 16'b1000100000001001;   // BEQ R4, R0, 9
      mem[12]  <= 16'b1111001000101011;   // SRL R5, R1
      mem[13]  <= 16'b1111111000110011;   // SRL R6, R7
      mem[14]  <= 16'b1111101110100001;   // SUB R4, R5, R6
      mem[15]  <= 16'b1011100000000101;   // BLTZ R4, 5
      mem[16]  <= 16'b1111111011111000;   // ADD R7, R7, R3
      mem[17]  <= 16'b0101011011000010;   // ADDI R3, R3, 2
      mem[18]  <= 16'b0101010010000001;   // ADDI R2, R2, 1
      mem[19]  <= 16'b1001111000110100;   // BNE R7, R0, -12
      mem[20]  <= 16'b1000111001000101;   // BEQ R7, R1, 5
      mem[21]  <= 16'b0100000010111101;   // SB R2, -3(R0)
      mem[22]  <= 16'b0101010010111111;   // ADDI R2, R2, -1
      mem[23]  <= 16'b0100000010111110;   // SB R2, -2(R0)
      mem[24]  <= 16'b0101000010111111;   // ADDI R2, R0, -1
      mem[25]  <= 16'b1010000000000010;   // BGEZ R0, 2
      mem[26]  <= 16'b0100000010111110;   // SB R2, -2(R0)
      mem[27]  <= 16'b0100000010111101;   // SB R2, -3(R0)
      mem[28]  <= 16'b0100000010111111;   // SB R2, -1(R0)
      mem[29]  <= 16'b0000000000000001;   // HALT

      for(i = 30; i < 128; i = i + 1) begin
        mem[i] <= 16'b0000000000000000;
      end
    end
  end

endmodule
