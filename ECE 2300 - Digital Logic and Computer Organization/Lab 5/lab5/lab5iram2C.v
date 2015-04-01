module lab5iram2C(CLK, RESET, ADDR, Q);
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
      mem[0]   <= 16'b0101011011000100;   // ADDI R3, R3, 4
      mem[1]   <= 16'b0101010010111111;   // ADDI R2, R2, -1
      mem[2]   <= 16'b0101011011111111;   // ADDI R3, R3, -1
      mem[3]   <= 16'b1001001011111101;   // BNE  R1, R3, -3
      mem[4]   <= 16'b0101010010000011;   // ADDI R2, R2, 3
      mem[5]   <= 16'b0101011011000100;   // ADDI R3, R3, 4
      mem[6]   <= 16'b0100010001000000;   // SB   R1, 0(R2)
      mem[7]   <= 16'b0101001001000001;   // ADDI R1, R1, 1
      mem[8]   <= 16'b0101011011111111;   // ADDI R3, R3, -1
      mem[9]   <= 16'b1010011000111100;   // BGEZ R3, -4
      mem[10]  <= 16'b0100010001000000;   // SB   R1, 0(R2)
      mem[11]  <= 16'b0000000000000001;   // HALT
      mem[12]  <= 16'b0010000110111001;   // LB   R6, -7(R0)
      mem[13]  <= 16'b1111110000101010;   // SRA  R5, R6
      mem[14]  <= 16'b1011101000000010;   // BLTZ R5, 2
      mem[15]  <= 16'b0100010101111110;   // SB   R5, -2(R2)
      mem[16]  <= 16'b1000000000000001;   // BEQ  R0, R0, 1
      mem[17]  <= 16'b0100010101111111;   // SB   R5, -1(R2)
      mem[18]  <= 16'b1111001001001001;   // SUB  R1, R1, R1
      mem[19]  <= 16'b0101001010000000;   // ADDI R2, R1, 0
      mem[20]  <= 16'b1111011001011101;   // AND  R3, R3, R1

      for(i = 21; i < 128; i = i + 1) begin
        mem[i] <= 16'b0000000000000000;
      end
    end
  end

endmodule
