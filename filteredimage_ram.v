module filteredimage_ram (
    input clk,
    input [7:0] sop,
    input [15:0] filtimAddr
);

    parameter IMG_SIZE = 256;

    reg [7:0] filtimRam [(IMG_SIZE-2)*(IMG_SIZE-2)-1:0];

    always @(posedge clk) 
    begin
       filtimRam[filtimAddr] <= sop;
    end


endmodule