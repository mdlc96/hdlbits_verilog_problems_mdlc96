module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire cout;
    wire coutcarry0, coutcarry1;
    wire [15:0] sum_high_carry0, sum_high_carry1;
    add16 lsbits (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(cout)
    );
    
    add16 msbits_carry0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_high_carry0),
        .cout(coutcarry0)
    );   
    
    add16 msbits_carry1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_high_carry1),
        .cout(coutcarry1)
    ); 
    
    always@(*) begin
        case(cout)
            1'b0:
                sum[31:16] <= sum_high_carry0;
            1'b1:
                sum[31:16] <= sum_high_carry1;
        endcase;
    end
        

endmodule
