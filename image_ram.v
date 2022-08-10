module image_ram (
    input [15:0] imAddr,
    output reg [7:0] p0, p1, p2, p3, p4, p5, p6, p7, p8
);

    parameter IMG_SIZE = 256;

    reg [7:0] imRam [IMG_SIZE*IMG_SIZE-1:0];

    $readmemb("image.mem", imRam);

    always @(*) 
    begin
        p0 <= imRam[imAddr];
        p1 <= imRam[imAddr+1];
        p2 <= imRam[imAddr+2];

        p3 <= imRam[imAddr+IMG_SIZE+3];
        p4 <= imRam[imAddr+IMG_SIZE+4];
        p5 <= imRam[imAddr+IMG_SIZE+5];

        p6 <= imRam[imAddr+2*IMG_SIZE+6];
        p7 <= imRam[imAddr+2*IMG_SIZE+7];
        p8 <= imRam[imAddr+2*IMG_SIZE+8];
    end


endmodule