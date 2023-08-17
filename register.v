module register
#(parameter WIDTH=8)
	(input wire clk,
 	 input wire load,
	 input wire [WIDTH-1:0] data_in,
	 output reg [WIDTH-1:0] data_out);

always @(posedge clk)
	data_out <= load ? data_in : data_out;
endmodule
