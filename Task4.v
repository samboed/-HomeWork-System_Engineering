module Task4(
					input sck,
					input mosi,
					input cs,
					output reg miso,
					output reg wr_en_out,
					output reg [23:0] wr_address_out,
					output reg [31:0] wr_data_out
				);

reg [7:0] command  = 8'h77;
reg [31:0] wr_data  = 32'b0;
reg unsigned [4:0] counter  = 5'b0;
reg write_status = 1'b0;
reg write_data_status = 1'b0;

initial
begin
	wr_en_out = 0;
	wr_address_out = 0;
	wr_data_out = 0;
end

always @(posedge sck)
begin
	if (!cs)
	begin
		wr_data <= {wr_data[30:0], mosi};
		if (!write_data_status)
		begin
			if (!write_status && (counter == 8))
			begin
				if (wr_data[7:0] != command[7:0])
				begin
					wr_en_out <= 1'b0;
					counter = 0;
				end
				else
					write_status <= 1'b1;
			end
			if (counter == 31)
				begin
					wr_en_out <= 1'b1;
					wr_address_out <= wr_data[23:0];
					counter <= 0;
					write_data_status <= 1'b1;
					wr_data <= 1'b0;
				end	
			else
				counter <= counter + 1;
		end	
		else
		begin
			if (counter == 31)
			begin
				wr_data_out <= wr_data[31:0];
				counter <= 0;
			end
			else
				counter <= counter + 1;
			miso <= wr_data[31];
		end
	end
	else
	begin
		write_status <= 1'b0;
		write_data_status <= 1'b0;
		wr_en_out <= 1'b0;
		wr_address_out <= 0;
		wr_data_out <= 0;
		wr_data <= 32'b0;
		counter <= 0;
		miso <= 1'b0;
	end
end

endmodule