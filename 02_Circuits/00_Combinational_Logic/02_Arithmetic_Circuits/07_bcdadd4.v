module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire cout_mid[3:0];
    
    assign cout = cout_mid[3];
    
    generate
        genvar i;
        for (i = 0; i <= 3; i++) begin : generate_adders
            if (i == 0)
                bcd_fadd adder (.a(a[4*i +: 4]), .b(b[4*i +: 4]), .cin(cin), .cout(cout_mid[i]), .sum(sum[4*i +: 4]));
            else 
                bcd_fadd adder (.a(a[4*i +: 4]), .b(b[4*i +: 4]), .cin(cout_mid[i-1]), .cout(cout_mid[i]), .sum(sum[4*i +: 4]));    
        end
    endgenerate

endmodule