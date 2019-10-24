module Supercar   (// Interface di TOP

						input wire CLOCK_50,  input wire [9:0]SW, input wire [3:0]KEY,
						output reg [6:0]HEX0, output reg [6:0]HEX1, output reg [6:0]HEX2,
						output reg [6:0]HEX3, output [9:0]LEDR
						);
wire clk, CE, reset, CE_led;
reg cntEN;
wire [18:0] led;
wire [9:0] ktm;
wire [9:0] cntOUT;
reg [9:0] startDX = 10'b1111111111;
reg [18:0] Pin;
reg [3:0]val0 = 4'b0000;
reg [3:0]val1 = 4'b0000;
reg [3:0]val2 = 4'b0000;
reg [3:0]val3 = 4'b0000;
wire [6:0]d0;
wire [6:0]d1;
wire [6:0]d2;
wire [6:0]d3;
assign clk = CLOCK_50;
assign reset = !KEY[0];

assign ktm [0] = led[9];
assign ktm[1] = led[8] || led[10];
assign ktm[2] = led[7] || led[11];
assign ktm[3] = led[6] || led[12];
assign ktm[4] = led[5] || led[13];
assign ktm[5] = led[4] || led[14];
assign ktm[6] = led[3] || led[15];
assign ktm[7] = led[2] || led[16];
assign ktm[8] = led[1] || led[17];
assign ktm[9] = led[0] || led[18];

assign LEDR = (cntEN) ? ktm : startDX; 


display7seg seg_zero(.A(val0), .Y(d0));	//da binario a esadecimale
display7seg seg_one(.A(val1), .Y(d1));		//da binario a esadecimale
display7seg seg_two(.A(val2), .Y(d2));		//da binario a esadecimale
display7seg seg_three(.A(val3), .Y(d3));	//da binario a esadecimale
clockdivider clk2Hz(.clock_in(clk), .clock_out(CE));
clockdivider2 clk10hz(.clock_in(clk), .clock_out(CE_led));
cntUP srDX(.CLK(CE_led),.CE(cntEN),.reset(reset),.load(load),.Pin(Pin),.Pout(led));

always@(posedge clk  or posedge reset)
begin
if (reset)
	begin
			 val0 <= 7'b0000000;
			 val1 <= 7'b0000000;
			 val2 <= 7'b0000000;
			 val3 <= 7'b0000000;
			 startDX <= 10'b0;
			 Pin <= 19'b1000000000000000000;
	end
	
else
	begin

	if(CE)
		begin
			case(KEY) 
					4'b1101 :	begin
									val1 <= val1+1;					//incremento : mode1
									
									end
					4'b1011 :	begin
									val2 <= val2-1;					//decremento : mode2
									
									end
					4'b0111 : 	cntEN <= 1'b1;
							
					default : begin
								 val3 <= val1 + val2;
								 cntEN <= 1'b0;
								 startDX <= ~startDX;
								 Pin <= 19'b1000000000000000000;
								 end
			endcase

		end
	end
HEX0 <= d0; //assegnamento display
HEX1 <= d1; //assegnamento display
HEX2 <= d2; //assegnamento display
HEX3 <= d3; //assegnamento display
end
endmodule 

