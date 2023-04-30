module trafik_isik(input clk, btn, output reg [2:0] led);

parameter RED_TIME = 29'd27_000_000*10; // 10 saniye
parameter BLUE_TIME = 29'd27_000_000*2; // 2 saniye
parameter GREEN_TIME = 29'd27_000_000*5; // 5 saniye

reg [31:0] counter;

always @(posedge clk) begin
    if (btn) begin
        counter <= counter + 1;
        if (counter >= RED_TIME && counter < RED_TIME + BLUE_TIME) begin
            led <= 3'b101; // mavi
        end
        else if (counter >= RED_TIME + BLUE_TIME && counter < RED_TIME + BLUE_TIME + GREEN_TIME) begin
            led <= 3'b011; // yeşil
        end
        else begin
            led <= 3'b110; // kırmızı
        end
        if (counter >= RED_TIME + BLUE_TIME + GREEN_TIME) begin
            counter <= 0;
        end
    end
    else begin
        led <= 3'b110; // varsayılan olarak kırmızı
        counter <= 0;
    end
end

endmodule