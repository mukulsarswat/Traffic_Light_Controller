
module tb_traffic_light_controller;

    reg clk;
    reg reset;
    wire red, yellow, green;

    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10ns period
   initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light_controller);
   end

    initial begin
     
        reset = 1;
        #10;
        reset = 0;

        // Run simulation for 100 clock cycles
        #1000;

        $finish;
    end

endmodule
