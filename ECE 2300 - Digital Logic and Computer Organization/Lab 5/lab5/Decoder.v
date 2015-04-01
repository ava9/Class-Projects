module Decoder(INSTR, DR, SA, SB, IMMO, MB, FS, MD, LD, MW, HALT, BS, OFF);
  input [15:0] INSTR;
    
  output [2:0] DR;
  output [2:0] SA;
  output [2:0] SB;
  output [5:0] IMMO;
  output MB;
  output [2:0] FS;
  output MD;
  output LD;
  output MW;
  output HALT;
  output [2:0] BS;
  output [5:0] OFF;
  
  parameter [3:0] RTYPE = 4'b1111;
  parameter [3:0] OTHER = 4'b0000;
  parameter [1:0] BRANCH = 2'b10;
  
  parameter [2:0] ADD = 3'b000;
  parameter [2:0] SUB = 3'b001;
  parameter [2:0] SRA = 3'b010;
  parameter [2:0] SRL = 3'b011;
  parameter [2:0] SLL = 3'b100;
  parameter [2:0] AND = 3'b101;
  parameter [2:0] OR  = 3'b110;
  
  parameter [3:0] LB = 4'b0010;
  parameter [3:0] PSB = 4'b0100;
  parameter [3:0] ADDI = 4'b0101;
  parameter [3:0] ANDI = 4'b0110;
  parameter [3:0] ORI = 4'b0111;
  
  parameter [1:0] BEQ = 2'b00;
  parameter [1:0] BNE = 2'b01;
  parameter [1:0] BGEZ = 2'b10;
  parameter [1:0] BLTZ = 2'b11;
  
  reg [2:0] DR;
  reg [2:0] SA;
  reg [2:0] SB;
  reg [5:0] IMMO;
  reg MB;
  reg [2:0] FS;
  reg MD;
  reg LD;
  reg MW;
  reg HALT;
  reg [2:0] BS;
  reg [5:0] OFF;
  
  wire [1:0] BRANCH_TYPE = INSTR[15:14];
  wire [1:0] BRANCH_INSTRUCTION = INSTR[13:12];
  wire [3:0] OP = INSTR[15:12];
  wire [2:0] RS = INSTR[11:9];
  wire [2:0] RT = INSTR[8:6];
  wire [2:0] RD = INSTR[5:3];
  wire [2:0] FUNCT = INSTR[2:0];
  wire [5:0] IMMV = INSTR[5:0];
  
  always @(*) begin
    case (BRANCH_TYPE)
	 BRANCH: begin
	   case(BRANCH_INSTRUCTION)
		  BEQ: begin
		    DR <= 3'b000;
            SA <= RS;
            SB <= RT;
            IMMO <= IMMV;
            MB <= 1'b0;
            FS <= SUB;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            HALT <= 1'b0; BS <= 3'b000;
				OFF <= IMMV;
		  end
		  BNE: begin
		  DR <= 3'b000;
            SA <= RS;
            SB <= RT;
            IMMO <= IMMV;
            MB <= 1'b0;
            FS <= SUB;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            HALT <= 1'b0; BS <= 3'b001;
				OFF <= IMMV;
		  end
		  BGEZ: begin
		  DR <= 3'b000;
            SA <= RS;
            SB <= 3'b000;
            IMMO <= 6'b000000;
            MB <= 1'b1;
            FS <= SUB;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            HALT <= 1'b0; BS <= 3'b010;
				OFF <= IMMV;
		  end
		  BLTZ: begin
		  DR <= 3'b000;
            SA <= RS;
            SB <= 3'b000;
            IMMO <= 6'b000000;
            MB <= 1'b1;
            FS <= SUB;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            HALT <= 1'b0; BS <= 3'b011;
				OFF <= IMMV;
		  end
		endcase
	 end
	 default: begin
    // If the instruction is either NOP or HALT
    case (OP)
      OTHER: begin
        case (FUNCT)
          3'b000: begin // NOP
            DR <= 3'b000;
            SA <= 3'b000;
            SB <= 3'b000;
            IMMO <= 6'b000000;
            MB <= 1'b0;
            FS <= 3'b000;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          3'b001: begin // HALT
            DR <= 3'b000;
            SA <= 3'b000;
            SB <= 3'b000;
            IMMO <= 6'b000000;
            MB <= 1'b0;
            FS <= 3'b000;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            
            HALT <= 1'b1;
				BS <= 3'b100; OFF <= 6'b000000;
          end
			 default: begin
			   DR <= 3'b000;
            SA <= 3'b000;
            SB <= 3'b000;
            IMMO <= 6'b000000;
            MB <= 1'b0;
            FS <= 3'b000;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
			 end
        endcase
      end 
      RTYPE: begin
        // else if the instruction is a R-type instruction
      
        // Switch on the lower 3 bits
        case (FUNCT) 
          ADD: begin
            FS <= ADD;
            DR <= RD;
            SA <= RS;
            SB <= RT;
          
            LD <= 1'b1;
            MB <= 1'b0;
            MD <= 1'b0;
            MW <= 1'b0;
          
            IMMO <= 6'b000000;
            
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          SUB: begin
            FS <= SUB;
            DR <= RD;
            SA <= RS;
            SB <= RT;
          
            LD <= 1'b1;
            MB <= 1'b0;
            MD <= 1'b0;
            MW <= 1'b0;
          
            IMMO <= 6'b000000;
          
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          SRA: begin
            FS <= SRA;
            DR <= RD;
            SA <= RS;
            SB <= 3'b000;
          
            LD <= 1'b1;
            MB <= 1'b0;
            MD <= 1'b0;
            MW <= 1'b0;
          
            IMMO <= 6'b000000;
          
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          SRL: begin
            FS <= SRL;
            DR <= RD;
            SA <= RS;
            SB <= 3'b000;
          
            LD <= 1'b1;
            MB <= 1'b0;
            MD <= 1'b0;
            MW <= 1'b0;
          
            IMMO <= 6'b000000;
          
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          SLL: begin
            FS <= SLL;
            DR <= RD;
            SA <= RS;
            SB <= 3'b000;
          
            LD <= 1'b1;
            MB <= 1'b0;
            MD <= 1'b0;
            MW <= 1'b0;
          
            IMMO <= 6'b000000;
          
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          AND: begin
            FS <= AND;
            DR <= RD;
            SA <= RS;
            SB <= RT;
          
            LD <= 1'b1;
            MB <= 1'b0;
            MD <= 1'b0;
            MW <= 1'b0;
          
            IMMO <= 6'b000000;
          
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          OR : begin
            FS <= OR;
            DR <= RD;
            SA <= RS;
            SB <= RT;
          
            LD <= 1'b1;
            MB <= 1'b0;
            MD <= 1'b0;
            MW <= 1'b0;
          
            IMMO <= 6'b000000;
          
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          default: begin
            DR <= 3'b000;
            SA <= 3'b000;
            SB <= 3'b000;
            IMMO <= 6'b000000;
            MB <= 1'b0;
            FS <= 3'b000;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
        endcase
      end 
      default: begin
        // Otherwise the instruction is an S-type instruction
      
        case (OP)
          LB: begin
            FS <= ADD;
            DR <= RT;
            SA <= RS;
            SB <= 3'b000;
          
            IMMO <= IMMV;
            MB <= 1'b1;
          
            LD <= 1'b1;
            MD <= 1'b1;
            MW <= 1'b0;
            
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          PSB: begin
            FS <= ADD;
            SA <= RS;
            SB <= RT;
            DR <= 3'b000;
          
            IMMO <= IMMV;
            MB <= 1'b1;
          
            LD <= 1'b0;
            MW <= 1'b1;
            MD <= 1'b0;
            
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          ADDI: begin
            FS <= ADD;
            DR <= RT;
            SA <= RS;
            SB <= 3'b000;
          
            IMMO <= IMMV;
            MB <= 1'b1;
          
            LD <= 1'b1;
            MW <= 1'b0;
            MD <= 1'b0;
            
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          ANDI: begin
            FS <= AND;
            DR <= RT;
            SA <= RS;
            SB <= 3'b000;
          
            IMMO <= IMMV;
            MB <= 1'b1;
          
            LD <= 1'b1;
            MW <= 1'b0;
            MD <= 1'b0;
            
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          ORI: begin
            FS <= OR;
            DR <= RT;
            SA <= RS;
            SB <= 3'b000;
          
            IMMO <= IMMV;
            MB <= 1'b1;
          
            LD <= 1'b1;
            MW <= 1'b0;
            MD <= 1'b0;
            
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
          default: begin
            DR <= 3'b000;
            SA <= 3'b000;
            SB <= 3'b000;
            IMMO <= 6'b000000;
            MB <= 1'b0;
            FS <= 3'b000;
            MD <= 1'b0;
            LD <= 1'b0;
            MW <= 1'b0;
            
            HALT <= 1'b0; BS <= 3'b100; OFF <= 6'b000000;
          end
        endcase
      end
    endcase
	 end
	 endcase
  end
endmodule