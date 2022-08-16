`timescale 1ns / 10ps

module tb_convolve ();

    parameter T = 10;

    reg rst, clk;
    wire done;

    initial	
    begin
        clk = 0;
        forever	#(T/2)	clk =~ clk;
    end

    convolve uut (rst, clk, done);

    initial 
    begin
        rst <= 1;
        #100;
        rst <= 0;
    end

endmodule



