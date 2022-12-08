module top_module ( input clk, input d, output q );
    wire din1;
    wire din2;
    
    my_dff inst1 (
        .clk(clk),
        .d(d),
        .q(din1)
    );
    
    my_dff inst2 (
        .clk(clk),
        .d(din1),
        .q(din2)
    );
    
    my_dff inst3 (
        .clk(clk),
        .d(din2),
        .q(q)
    );
endmodule