module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    
    wire [7:0] min_inter1, min_inter2;
    
    assign min_inter1 = (a < b) ? a : b;
    assign min_inter2 = (c < d) ? c : d;
    assign min = (min_inter1 < min_inter2) ? min_inter1 : min_inter2;

endmodule