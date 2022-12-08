module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    one_bit_adder test_0 (
        .a (a[0]),
        .b (b[0]),
        .cin (cin),
        .cout (cout[0]),
        .sum (sum[0])
    );
    
    
    genvar i;
    generate
        for(i = 1; i<= 99; i++) begin : generate_adders
            one_bit_adder test_i (
                .a (a[i]),
                .b (b[i]),
                .cin (cout[i-1]),
                .cout (cout[i]),
                .sum (sum[i])
            );      
        end
    endgenerate

endmodule

module one_bit_adder(
    input a,b,
    input cin,
    output cout,
    output sum
);
    wire [1:0] temp;
    assign temp = a + b + cin;
    assign sum = temp[0];
    assign cout = temp[1];
endmodule