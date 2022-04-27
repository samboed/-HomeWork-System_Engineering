module Task2( 
					input clk,
					input enable,
					input bit_in,
					input num_end,
					output reg res_out
				);
				
reg [1:0] state;
reg [1:0] next_state;


always @(posedge clk)
begin
	if (enable)
		state <= next_state;
	else if (num_end)
		begin
		res_out <= (state == 0) ? 1 : 0;
		state <= 0;
		end
end	

always @(*)
begin
	case (state)
			0: begin
						next_state = bit_in ? 1 : 0;
				end
			1: begin
						next_state = bit_in ? 0 : 2;
				end
			2: begin
						next_state = bit_in ? 2 : 1;
				end
			default: next_state = 0;
				
	endcase
end
endmodule
