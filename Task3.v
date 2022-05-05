module Task3(
					input [7:0] X0,
					input [7:0] X1,
					input [7:0] X2, // КИХ-фильтр 3 порядка
					input [7:0] X3, // reserve - КИХ-фильтр 4 порядка
					input [7:0] A0,
					input [7:0] A1,
					input [7:0] A2, // КИХ-фильтр 3 порядка
					input [7:0] A3, // reserve - КИХ-фильтр 4 порядка
					input clk,
					input enable,
					output reg [17:0] result
				);
				
reg mult_en = 0;
reg mult_counter;
reg [17:0] z;
reg [7:0] x0,y0,x1,y1;
reg [15:0] result_mult0;
reg [15:0] result_mult1;

always @(posedge clk)
begin
	mult_en <= enable | (mult_counter == 0 & mult_en == 1) ? 1 : 0;
	mult_counter = mult_en & mult_counter == 0 ? 1 : 0;
end

always @(posedge clk)
begin	
	x0 = mult_counter == 0 ? A0:A1;
	y0 = mult_counter == 0 ? X0:X1;
	x1 = mult_counter == 0 ? A2:A3;
	y1 = mult_counter == 0 ? X2:X3;
end

always @(*)
begin	
	if (mult_en)
	begin
		z = mult_counter == 0 ? result_mult0 + result_mult1 : z;
		result <= mult_counter == 1 ? z + result_mult0 + result_mult1 : 0;
	end
end

always @(*)
begin
	result_mult0 = x0*y0;
	result_mult1 = x1*y1;
end
endmodule