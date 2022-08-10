module sop (
    input [7:0] p0, p1, p2, p3, p4, p5, p6, p7, p8, k0, k1, k2, k3, k4, k5, k6, k7, k8,
    output reg [7:0] sop
);

    always @(*) 
    begin
        sop <= p0*k0 + p1*k1 + p2*k2 + p3*k3 + p4*k4 + p5*k5 + p6*k6 + p7*k7 + p8*k8;
    end
    
endmodule