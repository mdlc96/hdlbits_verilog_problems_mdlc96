module FA (
    input x,
    input y,
    input cin,
    output sum,
    output cout);
    
    assign {cout, sum} = x + y + cin;
endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire cout[2:0];
    
    //FA f0 ( .x(x[0]), .y(y[0]), .cin(1'b0), .cout(cout[0]), .sum(sum[0]));
    //FA f1 ( .x(x[1]), .y(y[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
    //FA f2 ( .x(x[2]), .y(y[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
           
    generate 
        genvar i;
        for(i = 0 ; i<=3; i++) begin : generate_adders
            if (i == 0)
                FA adder ( .x(x[i]), .y(y[i]), .cin(1'b0), .cout(cout[i]), .sum(sum[i]));
            else if (i == 3)
                FA adder ( .x(x[i]), .y(y[i]), .cin(cout[i-1]), .cout(sum[i+1]), .sum(sum[i]));
            else
                FA adder ( .x(x[i]), .y(y[i]), .cin(cout[i-1]), .cout(cout[i]), .sum(sum[i]));             
            end
    endgenerate

endmodule
