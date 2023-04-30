module trafik_isik(input clk, btn, output reg [2:0] led);

parameter RED_TIME = 10_000_000; // 10 saniye
parameter BLUE_TIME = 2_000_000; // 2 saniye
parameter GREEN_TIME = 5_000_000; // 5 saniye

reg [25:0] counter;

always @(posedge clk) begin
    if (btn) begin
        counter <= counter + 1;
        if (counter >= RED_TIME && counter < RED_TIME + BLUE_TIME) begin
            led <= 3'b010; // mavi
        end
        else if (counter >= RED_TIME + BLUE_TIME && counter < RED_TIME + BLUE_TIME + GREEN_TIME) begin
            led <= 3'b001; // yeşil
        end
        else begin
            led <= 3'b100; // kırmızı
        end
        if (counter >= RED_TIME + BLUE_TIME + GREEN_TIME) begin
            counter <= 0;
        end
    end
    else begin
        led <= 3'b100; // varsayılan olarak kırmızı
        counter <= 0;
    end
end

endmodule