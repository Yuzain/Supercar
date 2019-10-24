// Shift Register 16 bit wide 
module cntUP	(
				input 			CLK,
				input				CE,
				input				reset,
				input				load,
				input				Sin,
				input 	[ 18:0 ]	Pin,
				output 	[ 18:0 ]	Pout,
				output				Sout
				);

reg [18:0] M;

always @(posedge CLK or negedge !reset)
begin
	if( reset )
	begin
		M <= Pin;
	end
	else if (CE)
				begin
					if (M[1])
						M <= Pin;
					else 
						M <= {1'b0,M[18:1]};							
				end
				
		  else M <= Pin;
end

assign Pout = M;
assign Sout = M[0];

endmodule