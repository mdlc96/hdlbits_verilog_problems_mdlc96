module top_module( 
    input a, b, cin,
    output cout, sum );
    wire [1:0] temp;
    
    assign temp = a + b + cin;
    assign cout = temp[1];
    assign sum = temp[0];

endmodule