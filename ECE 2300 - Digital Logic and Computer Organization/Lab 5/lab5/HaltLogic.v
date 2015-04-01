module HaltLogic(CLK, RESET, HALT, EN_L, H);
  input CLK;
  input RESET;
  input HALT;
  input EN_L;
  
  output H;
  
  reg EN_L_PREV;
  
  wire EN_CHANGE;
  
  // Pretty sure this will break if EN_L changes exactly on the clock...
  always @(posedge CLK) begin
    EN_L_PREV <= RESET ? 1'b1 : EN_L;
  end
  
  assign EN_CHANGE = ~EN_L && EN_L_PREV;
  
  assign H = HALT ? (EN_CHANGE ? 1'b0 : 1'b1) : 1'b0;

endmodule