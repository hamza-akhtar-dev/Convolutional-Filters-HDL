module filtered_ram (
    input clk,
    input [7:0] sop,
    input [15:0] filtAddr
);

    parameter IMG_SIZE = 256;

    reg [7:0] filtRam [(IMG_SIZE-1)*(IMG_SIZE-1)-1:0];

    always @(posedge clk) 
    begin
       filtRam[filtAddr] <= sop;
    end


endmodule