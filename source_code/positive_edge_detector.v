/* 
positive_edge_detector is to delay the original signal by 1 clock cycle, 
then the inverse of the delayed signal peforms a logic AND with the original signal
*/    
module positive_edge_detector (
    input signal, // input signal for which positive edge has to be detected
    input clk, // input signal for clock
    output pulse // output signal that gives a pulse when a positive edge occurs
);

   reg signal_delay; // internal signal stores the delayed signal

   // ensure the signal_delay is exactly 1 clock behind the signal
   always @(posedge clk) begin
       signal_delay <= signal;
   end

   // combinational logic where the inverse of the delayed signal peforms a logic AND with the original signal
   // then assign the evaluated expression to the pulse
   assign pulse = signal & ~signal_delay;

endmodule