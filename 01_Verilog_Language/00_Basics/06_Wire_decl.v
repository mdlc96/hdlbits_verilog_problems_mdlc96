`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire out_and_one;
    wire out_and_two;
    
    assign out_and_one = a & b;
    assign out_and_two = c & d;
    assign out = out_and_one || out_and_two;
    assign out_n = !out;

endmodule
