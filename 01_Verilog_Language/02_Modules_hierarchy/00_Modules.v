module top_module ( input a, input b, output out );
    
    mod_a i_mod_a ( .in1(a), .in2(b), .out(out) );

endmodule