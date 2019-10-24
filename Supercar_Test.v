`timescale 1ns / 100ps  //definisce le unit� di tempo e la risoluzione della simulazione
`include "Supercar.v"
module Supercar_Test; // si noti che non ha porte

// Declare "inputs as regs" and "outputs as wires"
reg tb_clk;

wire [6:0] tb_HEX0, tb_HEX1, tb_HEX2, tb_HEX3;
reg [3:0]tb_KEY;


//istanziazione: Nome_modulo LABEL (.porta(segnale),...)
	Supercar UUT (.CLOCK_50(tb_clk),.KEY(tb_KEY),.HEX0(tb_HEX0),.HEX1(tb_HEX1),.HEX2(tb_HEX2),.HEX3(tb_HEX3));

	always begin
	//valore iniziale del clk � 0
	#5 tb_clk = ~tb_clk; // Toggle clock every 5 ticks
	end


	initial begin
	$dumpvars;  // tutte i segnali sono memorizzati nel file di uscita - si potrebbero anche selezionare elencandoli
	tb_clk = 1'b0;
  tb_KEY = 4'b0001;	//valore iniziale

	#20	tb_KEY = 4'b1111;
  #20	tb_KEY = 4'b1110;
	#10	tb_KEY = 4'b1101;
  #1000000000 $finish;         // Terminate simulation
	end


endmodule
