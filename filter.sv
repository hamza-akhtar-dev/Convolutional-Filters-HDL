`timescale 1ns / 10ps

module filter ();

    parameter IMG_SIZE = 1000;
    
    logic [7:0] img [IMG_SIZE*IMG_SIZE-1:0];
    logic [7:0] new_pixel;

    integer file_id, i, j, k;

    logic clk;

    initial 
    begin
        $readmemb("img.mem", img);
        file_id =  $fopen ("out_img.txt");
    end

    initial
    begin
        i = 0;
        j = 0;
        k = 0;
        clk = 1'b0;
    end

    always
    begin
        #10;
        clk <= ~clk;
    end

    always@(posedge(clk)) 
    begin
        i <= i + 1;
        j <= j + 1;
        $fdisplay(file_id, "%d", new_pixel);
    end

    always@(i, j)
    begin
        if( j == IMG_SIZE - 2 )
        begin
        
            j = 0;
            
            k = k + 1;   
            
            if( k == IMG_SIZE - 2 )
            begin 
                k = 0;
                $fclose(file_id);
                $stop;
            end
    
            i = IMG_SIZE*k;
            
        end
    end

    mean mn (img[i], img[i+1], img[i+2], img[i+IMG_SIZE], img[i+IMG_SIZE+1], img[i+IMG_SIZE+2], img[i+2*IMG_SIZE], img[i+2*IMG_SIZE+1], img[i+2*IMG_SIZE+2], new_pixel);

endmodule



