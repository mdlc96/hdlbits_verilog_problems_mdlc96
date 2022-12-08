module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] adder_in_b;
    wire cout_lower_bits;
    wire cout_higher_bits;
    
    assign adder_in_b = b^{32{sub}};
    
    add16 lower_bits (
        .a(a[15:0]),
        .b(adder_in_b[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(cout_lower_bits)
    );
    
    add16 higher_bits (
        .a(a[31:16]),
        .b(adder_in_b[31:16]),
        .cin(cout_lower_bits),
        .sum(sum[31:16]),
        .cout(cout_higher_bits)     
    );

endmodule
