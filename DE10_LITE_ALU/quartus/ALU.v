module ALU
#(
parameter WIDTH = 4)
(
input [WIDTH-1:0] SrcA,
input [WIDTH-1:0] SrcB,
input [2:0] ALUControl,
output reg [WIDTH-1:0] ALUResult,
output Zero
);

always @ (ALUControl) begin
    case(ALUControl)
      3'b000    : ALUResult[0] = 1; 		
      3'b001    : ALUResult[1] = 1; 		
      //3'b10    : out = c; 		// If sel=2, output is c
      default  : ALUResult[3:0] = 0; 		// If sel is anything else, out is always 0
    endcase
 end

endmodule