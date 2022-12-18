module RegBank
#(
parameter WIDTH = 4,
SIZE = 3)
(
input CLK,
input WE3,
input [SIZE-1:0] A1,
input [SIZE-1:0] A2,
input [SIZE-1:0] A3,
input [WIDTH-1:0] WD3,
output reg [WIDTH-1:0] RD1,
output reg [WIDTH-1:0] RD2
);

// Se cria deste modo registradores
reg [WIDTH-1:0] R0;
reg [WIDTH-1:0] R1;
reg [WIDTH-1:0] R2;
reg [WIDTH-1:0] R3;

// Switch write
always @ (negedge CLK) begin

	if(WE3==1) begin
		 case(A3)
			2'b00    : R0 = WD3;		
			2'b01    : R1 = WD3;	
			2'b10    : R2 = WD3;	
			2'b11    : R3 = WD3;	
		 endcase
	end
	 
 end
 
// Switch read
always @ (A1 || A2) begin

	 case(A1)
		2'b00    : RD1 = R0;
      2'b01    : RD1 = R1;
		2'b10    : RD1 = R2;
		2'b11    : RD1 = R3;
    endcase
	 
	 case(A2)
		2'b00    : RD2 = R0;
      2'b01    : RD2 = R1;
		2'b10    : RD2 = R2;
		2'b11    : RD2 = R3;
    endcase
	 
 end


endmodule
