module positive_edge_detector_tb;
    reg signal; // a variable to drive the input signal of the design
    reg clk; // a variable to drive input clock of the design
    wire pulse; // a variable to capture the output pulse of the design
    
    // instantiate the design and connect signals in tb
    positive_edge_detector inst(
        .signal(signal),
        .clk(clk),
        .pulse(pulse)
    );

    // generate a clock (100 MHz)
    always #5 clk = ~ clk;

    // drive the stimulus to the design
    initial begin
        clk <= 0;
        signal <= 0;

        #15 signal <= 1;
        #20 signal <= 0;
        #15 signal <= 1;
        #10 signal <= 0;

        #20 $finish;
        
    end

endmodule
