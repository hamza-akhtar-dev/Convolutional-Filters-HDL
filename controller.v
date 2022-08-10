module controller(
    input rst, clk,
    output reg [15:0] imAddr, kAddr, filtAddr
);

parameter IMG_SIZE = 256;
parameter KER_SIZE = 3;

reg [7:0] count, temp;

always@(posedge clk) 
begin
    if(rst)
    begin
        imAddr <= 0;
        kAddr <= 0;
        filtAddr <= 0;
        count <= 0;
        temp <= 0;
    end
    else
    begin
        imAddr <= imAddr + 1;
        temp <= 1;
		/*as the imAddr will be updated we need to subtract 1, and in order to jump to new column
		  count variable is used */
		if (temp == (IMG_SIZE-2))
        begin
            #1000;//just break out of the block
        end
        else if (imAddr == (IMG_SIZE - KER_SIZE + count - 1))
        begin
            count <= count + IMG_SIZE;
            imAddr <= imAddr + IMG_SIZE - KER_SIZE;
        end
        
    end
end

endmodule