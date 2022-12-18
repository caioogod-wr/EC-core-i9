module ALU
#(
parameter WIDTH = 4)
(
input [WIDTH-1:0] SrcA,
input [WIDTH-1:0] SrcB,
input [2:0] ALUControl,
output reg [WIDTH-1:0] ALUResult,
output reg Zero
);

// Função que checa se o input é zero (A==0)
function automatic iszero;
    input [3:0] A;
    begin
		if(A==0) begin
			iszero=1;
		end else begin
			iszero=0;
		end
    end
  endfunction

// Função que soma dois números (A+B)
function automatic [3:0] soma;
    input [3:0] A;
	 input [3:0] B; 
    begin
      soma=A+B;
    end
  endfunction
  
// Função que subtrai dois números (A-B)
function automatic [3:0] subtrai;
    input [3:0] A;
	 input [3:0] B; 
    begin
      subtrai=A-B;
    end
  endfunction
  
// Função que compara dois números (A&B)
function automatic [3:0] AandB;
    input [3:0] A;
	 input [3:0] B; 
    begin
      AandB=A&B;
    end
  endfunction
  
// Função que compara dois números (A|B)
function automatic [3:0] AorB;
    input [3:0] A;
	 input [3:0] B; 
    begin
      AorB=A|B;
    end
  endfunction
  
// Função que compara dois números (A<B)
function automatic [3:0] AsltB;
    input [3:0] A;
	 input [3:0] B; 
    begin
      AsltB=A<B;
    end
  endfunction
  
// Switch
always @ (ALUControl) begin
    case(ALUControl)
      3'b000    : ALUResult = soma(SrcA,SrcB); 		
      3'b001    : ALUResult = subtrai(SrcA,SrcB); 		
      3'b010    : ALUResult = AandB(SrcA,SrcB);
		3'b011    : ALUResult = AorB(SrcA,SrcB);
		3'b101    : ALUResult = AsltB(SrcA,SrcB);
      default  : begin ALUResult[3:0] = 0; Zero = 0; end // If sel is anything else, out is always 0
    endcase
	 Zero=iszero(ALUResult); // se a saída for 0, a flag de 0 acende
 end

endmodule