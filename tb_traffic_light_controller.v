
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



// ************** TRAFFIC LIGHT CONTROLLER USES THE INPUT FILE FOR EXECUTION ****************************//
module tb_traffic_light_controller;

    reg clk;
    reg reset;
    wire red, yellow, green;

    integer data_file;
    integer scan_file;
    integer time_ns;
    integer expected_red, expected_yellow, expected_green;
    integer count = 0;

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

    // VCD dump
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light_controller);
    end

    // Apply reset
    initial begin
        reset = 1;
        #10;
        reset = 0;
    end

    // Read expected values from input.txt
    initial begin
        data_file = $fopen("input.txt", "r");
        if (data_file == 0) begin
            $display("ERROR: Could not open input.txt");
            $finish;
        end

        // Skip header line
        scan_file = $fscanf(data_file, "%s %s %s %s\n", time_ns, expected_red, expected_yellow, expected_green);

        $display("Time\tExpected_R\tExpected_Y\tExpected_G\t| Actual_R\tActual_Y\tActual_G");

        while (!$feof(data_file)) begin
            scan_file = $fscanf(data_file, "%d %d %d %d\n", time_ns, expected_red, expected_yellow, expected_green);
            #(time_ns - $time); // wait until the specified time

            $display("%0t\t   %b\t\t   %b\t\t   %b\t|    %b\t\t   %b\t\t   %b",
                     $time, expected_red, expected_yellow, expected_green,
                     red, yellow, green);

            count = count + 1;
        end

        $fclose(data_file);
        $display("\nTotal checks performed: %0d", count);
        $finish;
    end

endmodule

