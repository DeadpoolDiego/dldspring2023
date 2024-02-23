`timescale 1ns / 1ps
module tb ();

   logic        [3:0]a;
   logic 		[3:0]b;
   logic 		[3:0]c;
   logic 		[3:0]y;
   logic        clk;
   logic        cout;
   logic        [3:0]sum;   
   logic		[3:0]sum_corr;
   logic		[3:0]sum_correct;
   logic		cin;
   
  // instantiate device under test
   //fullAdder dut (a, b, c, y);

   rippleCarry rcA1 (a,b,cin,sum,cout);


 ////////////////////////////////////////////////////////////////////
   // 20 ns clock	
	

	initial 
     begin	
		clk = 1'b1;
		forever #10 clk = ~clk;
     end

	integer handle3;
	integer desc3;
	integer i;

	initial
		begin
		  handle3 = $fopen("rca.out");
		  desc3 = handle3;
		  #1250 $finish;
		end

	initial
		begin
			for (i=0; i< 128; i=i+1)
				begin
				@(posedge clk)
				  begin	
				  	a = $random;
					b = $random;
				  end
				@(negedge clk)
				  begin
				  		$fdisplay(desc3, "%h %h || %h | %h | %b", a, b, sum, sum_correct, (sum == sum_corr));
				  end
				end
		end // @(negedge clk)


	
	


	

   
endmodule
