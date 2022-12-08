module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire add_cout[99:0];
    
    bcd_fadd first_adder (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(add_cout[0]),
        .sum(sum[3:0])
    );
    
    assign cout = add_cout[99];
    
    genvar i;
    generate
        for(i = 1; i<=99; i++) begin: gen_instances
            bcd_fadd adders (
                .a(a[4*i + 3 : 4*i]),
                .b(b[4*i + 3 : 4*i] ),
                .cin(add_cout[i-1]),
                .cout(add_cout[i]),
                .sum(sum[4*i + 3 : 4*i])
            );
        end
    endgenerate

endmodule
