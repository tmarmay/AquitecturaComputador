module maindec (input logic [10:0] Op,
					 output logic  Reg2Loc,
					 output logic ALUSrc,
					 output logic MemtoReg,
					 output logic RegWrite,
					 output logic MemRead,
					 output logic MemWrite,
					 output logic Branch,
					 output logic [1:0] ALUOp);

	always_comb
		casez (Op[10:0])
			11 'b111_1100_0010 : begin Reg2Loc = 0; ALUSrc = 1; MemtoReg = 1; RegWrite = 1; MemRead = 1; MemWrite = 0; Branch = 0; ALUOp = 00; end	//LDUR 
			11 'b111_1100_0000 : begin Reg2Loc = 1; ALUSrc = 1; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 1; Branch = 0; ALUOp = 00;	end//STUR
			11 'b101_1010_0??? : begin Reg2Loc = 1; ALUSrc = 0; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 1; ALUOp = 01;	end//CBZ
			11 'b100_0101_1000 : begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	end//ADD
			11 'b110_0101_1000 : begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	end//SUB
			11 'b100_0101_0000 : begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	end//AND
			11 'b101_0101_0000 : begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 10;	end//ORR
			default : begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 00; end  
		endcase
	
endmodule
