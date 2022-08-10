module convolve(
    input rst, clk
);

    controller()
    image_ram imram (imAddr, p0, p1, p2, p3, p4, p5, p6, p7, p8);
    kernel_ram kram (kAddr, k0, k1, k2, k3, k4, k5, k6, k7, k8);
    sop sp (p0, p1, p2, p3, p4, p5, p6, p7, p8, k0, k1, k2, k3, k4, k5, k6, k7, k8, sop);
    filtered_ram filtram (clk, sop, filtAddr)

endmodule