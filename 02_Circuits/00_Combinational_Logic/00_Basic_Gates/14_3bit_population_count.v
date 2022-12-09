module top_module( 
    input [2:0] in,
    output [1:0] out );
    integer i;
    
    wire [1:0] temp;
    always @(*) begin
        case(in)
            3'b001 : out <= 3'b001;
            3'b010 : out <= 3'b001;
            3'b100 : out <= 3'b001;
            3'b110 : out <= 3'b010;
            3'b101 : out <= 3'b010;
            3'b011 : out <= 3'b010;
            3'b111 : out <= 3'b011;
            default : out <= 3'b000;
        endcase
    end
endmodule