module fullAdder (input  logic a, b, c, output logic cout, sum);
   
  assign sum = ( ~a & ~b & c ) | ( ~c & ~a & b ) | ( a & ~b & ~c ) | ( a & b & c ) ;
  assign cout = ( a & b & ~c ) | ( a & ~b & c ) | ( ~a & b & c ) | ( a & b & c ) ;
   
endmodule

module rippleCarry (input logic [3:0] a, b, input logic c, output logic [3:0] sum, output logic cout);

  logic carry;
  logic carry1;
  logic carry2;
  
  fullAdder fA1(a[0],b[0],c,sum[0],carry);
  fullAdder fA2(a[1],b[1],carry,sum[1],carry1);
  fullAdder fA3(a[2],b[2],carry1,sum[2],carry2);
  fullAdder fA4(a[3],b[3],carry2,sum[3],cout);

endmodule