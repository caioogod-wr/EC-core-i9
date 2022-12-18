module counter
#(
parameter WIDTH = 4)
(
input clk, input clrn, output reg[WIDTH-1:0] q);

  parameter n = 10;

  parameter start_point= 0;

  parameter end_point= 1023;
  
  
  always @(posedge clk or negedge clrn) 
  // posedge trabalha na borda de subida que é quando botão deixa de ser apertado e negedge é quando você aperta
  // o padrão botão é estar em 1 e ele fica em 0 quando você clica

    begin

      if (~clrn) // if (~clrn) é síncrono

        q <=start_point; 

      else begin

        if (q==end_point)

                    q<=start_point;

                else 
					
                      q = q + 1;
							 
						

        

      end

    end

endmodule
