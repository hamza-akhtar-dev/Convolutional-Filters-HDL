module controller(
    input rst, clk,
    output reg done,
    output reg [15:0] imAddr, kAddr, filtAddr
);

parameter IMG_SIZE = 256;
parameter KER_SIZE = 3;

reg done;
reg [7:0] column_offset;

always@(posedge clk) 
begin
    
    if(rst)
    begin
        imAddr <= 1'b0;
        kAddr <= 1'b0;
        filtAddr <= 1'b0;
        column_offset <= 1'b0;
        done <= 1'b0;
    end

    else
    begin
        if (!done)
        begin

            imAddr <= imAddr + 1'b1;
            filtAddr <= filtAddr + 1'b1;
      
            else if (imAddr == (IMG_SIZE - KER_SIZE + column_offset))
            begin
                column_offset <= column_offset + IMG_SIZE;
                imAddr <= imAddr + IMG_SIZE - KER_SIZE;

                if (imAddr == (IMG_SIZE-2)*(IMG_SIZE-2))
                begin
                    done <= 1'b1;
                    imAddr <= 1'b0;
                    kAddr <= 1'b0;
                    filtAddr <= 1'b0;
                end
            end
        end
    end
end

endmodule