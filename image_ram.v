module image_ram (
    input [15:0] imAddr,
    output reg [7:0] p0, p1, p2, p3, p4, p5, p6, p7, p8
);

    parameter IMG_SIZE = 256;

    reg [7:0] imRam [IMG_SIZE*IMG_SIZE-1:0];

    initial 
    begin
        $readmemb("image.mem", imRam);
    end

    always @(*) 
    begin
        p0 <= imRam[imAddr];
        p1 <= imRam[imAddr+1];
        p2 <= imRam[imAddr+2];

        p3 <= imRam[imAddr+IMG_SIZE];
        p4 <= imRam[imAddr+IMG_SIZE+1];
        p5 <= imRam[imAddr+IMG_SIZE+2];

        p6 <= imRam[imAddr+2*IMG_SIZE];
        p7 <= imRam[imAddr+2*IMG_SIZE+1];
        p8 <= imRam[imAddr+2*IMG_SIZE+2];
    end


endmodule