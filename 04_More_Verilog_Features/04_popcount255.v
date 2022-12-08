module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    wire [7:0] temp;
    int i = 0;
    always @(*) begin
        out = 8'h00;
        for(i = 0; i<=254; i++) begin
            out = out + in[i];
        end
    end

endmodule