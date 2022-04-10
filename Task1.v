module multiplier(
							input  [7:0] in1,
							input  [7:0] in2,
							output [15:0] out
						);
  assign out = in1 * in2;
endmodule

module Task1( 
					output [15:0]	z,
					input	 [7:0]	a1,
					input	 [7:0]	b1,
					input	 [7:0]	a2,
					input	 [7:0]	b2,
					input  [1:0]	clk
				);
	
	reg [15:0] z0, z1, z2, z3;
	wire [15:0] r0;
	reg [15:0] reg_z0,	reg_z1;
	reg [7:0] one_a1, one_b1, one_b2, one_a2;
	reg [7:0] two_a1, two_b1, two_b2, two_a2;
	reg [7:0] three_b2, three_a2;
	reg [7:0] x, y;
	reg [15:0] t1, t2;
	reg [1:0] s = 0; 
	
   //  z = z0 - z1 + z2 + z3
	//  z = a1*a2 - b1*b2 + a1*b2(i) + a2*b1(i)
	//  z0 = a1*a2
	always @(posedge clk)
	begin
			one_a1 <= a1;
			one_b1 <= b1;
			one_b2 <= b2;
			one_a2 <= a2;
			
	end
	// z1 = b1*b2
	always @(posedge clk)
	begin
			reg_z0 <= z0;
			two_a1 <= one_a1;
			two_b1 <= one_b1;
			two_b2 <= one_b2;
			two_a2 <= one_a2;			
	end
	// z2 = a1*b2
	// t1 = z0 - z1
	always @(posedge clk)
	begin
			t1 <= z0 - z1;
			three_b2 <= two_b2;
			three_a2 <= two_a2;
			
	end
	// z3 == a2*b1
	// t2 == t1 + z2
	always @(posedge clk)
	begin
			t2 <= t1 + z2;
			
	end
	// z = t1 + t2
	assign z = t1 + t2;
	
	always @(posedge clk)
	begin
		if (s == 0)
		begin
		   s = s + 1;
			x = a1;
			y = a2;
			z0 = r0;
		end
		else if (s == 1)
		begin
			s = s + 1;
			x = one_b1;
			y = one_b2;
			z1 = r0;
		end
		else if (s == 2)
		begin
			s = s + 1;
			x = two_a1;
			y = two_b2;
			z2 = r0;
		end
		else
		begin
			s = 0;
			x = three_b2;
			y = three_a2;
			z3 = r0;
		end
	end
	
	multiplier multiplier0 (.in1(x), .in2(y), .out(r0));
		
	/*
	multiplier multiplier0 (.in1(a1), .in2(a2), .out(z0));
	multiplier multiplier1 (.in1(one_b1), .in2(one_b2), .out(z1));
	multiplier multiplier2 (.in1(two_a1), .in2(two_b2), .out(z2));
	multiplier multiplier3 (.in1(three_b2), .in2(three_a2), .out(z3));
	*/
endmodule	