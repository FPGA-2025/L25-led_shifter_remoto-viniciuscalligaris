module LedShifter #(
    parameter integer CLK_FREQ = 8 
) (
    input  wire clk,       
    input  wire rst_n,     
    output reg [7:0] leds  
);
    reg [0:0] counter;  

    always @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
            leds    <= 8'b0001_1111; 
        end else begin
            if (counter == 1) begin
                counter <= 0;
                leds <= {leds[6:0], leds[7]};
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
