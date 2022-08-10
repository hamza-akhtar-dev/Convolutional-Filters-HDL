module kernel_ram (
    input [15:0] krAddr,
    output reg [7:0] k0, k1, k2, k3, k4, k5, k6, k7, k8
);

    parameter KER_SIZE = 3;

    reg [7:0] kRam [KER_SIZE*KER_SIZE-1:0];

    $readmemb("kernel.mem", kRam);

    always @(*) 
    begin
        k0 <= kRam[krAddr];
        k1 <= kRam[krAddr+1];
        k2 <= kRam[krAddr+2];

        k3 <= kRam[krAddr+KER_SIZE+3];
        k4 <= kRam[krAddr+KER_SIZE+4];
        k5 <= kRam[krAddr+KER_SIZE+5];

        k6 <= kRam[krAddr+2*KER_SIZE+6];
        k7 <= kRam[krAddr+2*KER_SIZE+7];
        k8 <= kRam[krAddr+2*KER_SIZE+8];
    end


endmodule