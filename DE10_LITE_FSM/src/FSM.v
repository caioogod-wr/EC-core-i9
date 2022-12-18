module FSM
(
input CLK,
input CLR,
input [1:0] OP,
input [2:0] FUNCT3,
input ZERO,
output PCWrite,
output AdrSrc,
output MemWrite,
output IRWrite,
output reg [1:0] ResultSrc,
output reg [2:0] ALUControl,
output [1:0] ALUSrcA,
output [1:0] ALUSrcB,
output [1:0] ImmSrcB,
output RegWrite
);

// Função que identifica a operação
function automatic integer ula_aritmetica;
    input [1:0] A;
	 input [1:0] B; 
	 input [2:0] FUNCT3;
	 
    begin
	 
		case(FUNCT3)
			3'b000    : ula_aritmetica = 2'h11;
		endcase
	 
    end
	 
  endfunction


// Switch
always @ (OP | FUNCT3) begin
    case(OP)
      2'b00    : ResultSrc[1] = 1;//ula_aritmetica(ALUSrcA,ALUSrcB,FUNCT3); 		
      //3'b01    : ALUResult = subtrai(SrcA,SrcB); 		
      //3'b10    : ALUResult = AandB(SrcA,SrcB);
		//3'b11    : ALUResult = AorB(SrcA,SrcB);
    endcase
	 //Zero=iszero(ALUResult); // se a saída for 0, a flag de 0 acende
 end


endmodule