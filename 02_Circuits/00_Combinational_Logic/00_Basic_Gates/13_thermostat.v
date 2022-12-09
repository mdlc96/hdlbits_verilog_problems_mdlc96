module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always @(*) begin
        heater <= 1'b0;
        aircon <= 1'b0;
        fan <= 1'b0;
        //fan
        if (fan_on == 1'b1)
            fan <= 1'b1;
        
        //cooling
        if (mode == 1'b0)
            begin
                if (too_hot == 1'b1)
                    begin
                        aircon <= 1'b1;
                        fan <= 1'b1;
                    end
                
            end
        
        //heating
        else
            begin
                if (too_cold == 1'b1)
                    begin
                        heater <= 1'b1;
                        fan <= 1'b1;
                    end
            end     
    end

endmodule