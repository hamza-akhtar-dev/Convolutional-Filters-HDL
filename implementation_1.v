module controller(
    input rst, clk,
    output reg done,
    output reg [15:0] imAddr, kAddr, filtimAddr
);

parameter IMG_SIZE = 10;
parameter KER_SIZE = 3;

reg [7:0] column_offset;


 reg[3:0] currentState; 
 reg[3:0] nextState;   

always@(posedge clk)
begin          
    if(rst)
    begin
        currentState <= 2'b00;
    end
    else 
    begin
        currentState <= nextState;
    end
end

always@(*)
begin            
    case (currentState)
        2'b00: 
        begin
            imAddr = 0;
            kAddr = 0;
            filtimAddr = 0;
            column_offset = 0;
        end

        2'b01: 
        begin
            if (imAddr == (IMG_SIZE - KER_SIZE + column_offset))
            begin
                nextState = 2'b10;
                if(imAddr == (IMG_SIZE-2)*(IMG_SIZE-2))
                begin
                    nextState = 2'b11;
                end
            end
            imAddr = imAddr + 1;
            filtimAddr = filtimAddr + 1;
        end

        2'b10:
        begin
            column_offset = column_offset + 1
        end

        2'b11:
        begin
            done = 1;
        end

    endcase
end

always@(posedge clk) 
begin
    
    if(rst)
    begin
        imAddr <= 1'b0;
        kAddr <= 1'b0;
        filtimAddr <= 1'b0;
        column_offset <= 1'b0;
        done <= 1'b0;
    end

    else
    begin
        if (~done)
        begin
            imAddr <= imAddr + 1'b1;
            filtimAddr <= filtimAddr + 1'b1;
      
            if (imAddr == (IMG_SIZE - KER_SIZE + column_offset))
            begin

                column_offset <= column_offset + IMG_SIZE;
                imAddr <= column_offset;

                if (imAddr == (IMG_SIZE-2)*(IMG_SIZE-2))
                begin
                    done <= 1'b1;
                    imAddr <= 1'b0;
                    kAddr <= 1'b0;
                    filtimAddr <= 1'b0;
                end
                
            end
        end
    end
end

endmodule