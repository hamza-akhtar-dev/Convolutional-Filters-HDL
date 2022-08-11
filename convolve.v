module convolve(
    input rst, clk
);
    wire [15:0] imAddr, kAddr, filtAddr;
    wire [7:0] p0, p1, p2, p3, p4, p5, p6, p7, p8, k0, k1, k2, k3, k4, k5, k6, k7, k8, sop;
    
    controller c1 (rst, clk,imAddr, kAddr, filtAddr);
    image_ram imram (imAddr, p0, p1, p2, p3, p4, p5, p6, p7, p8);
    kernel_ram kram (kAddr, k0, k1, k2, k3, k4, k5, k6, k7, k8);
    sop sp (p0, p1, p2, p3, p4, p5, p6, p7, p8, k0, k1, k2, k3, k4, k5, k6, k7, k8, sop);
    filtered_ram filtram (clk, sop, filtAddr);

endmodule