module controller(
    input rst, clk,
    output reg [15:0] imAddr, kAddr, filtAddr
);

parameter IMG_SIZE = 256;
parameter KER_SIZE = 3;

reg [7:0] count;

always@(posedge clk) 
begin
    if(rst)
    begin
        imAddr <= 0;
        kAddr <= 0;
        filtAddr <= 0;
        count <= 1;
    end
    else
    begin
        imAddr <= imAddr + 1;
        if (imAddr == (IMG_SIZE - KERSIZE))
        begin
            count <= count * IMG_SIZE
            imAddr <= 0;
            imAddr <= imAddr + IMG_SIZE;
        end

    end
end

endmodule