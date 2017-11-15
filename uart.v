module uart(
	input wire [7:0] din,
	input wire wr_en,
	input wire clk_50m,
	output wire tx,
	output wire tx_busy,

	input wire rx,
	input wire rdy_clr,
	output wire rdy,
	output wire [7:0] dout
);

wire rxclk_en, txclk_en;

baud_rate_gen uart_baud(
	.clk_50m(clk_50m),
	.rxclk_en(rxclk_en),
	.txclk_en(txclk_en)
);

transmitter uart_tx(
	.tx(tx),
	.din(din),
	.clk_50m(clk_50m),
	.clken(txclk_en),
	.wr_en(wr_en),
	.tx_busy(tx_busy)
);

receiver uart_rx(
	.rx(rx),
	.data(dout),
	.clk_50m(clk_50m),
	.clken(rxclk_en),
	.rdy(rdy),
	.rdy_clr(rdy_clr)
);

endmodule
