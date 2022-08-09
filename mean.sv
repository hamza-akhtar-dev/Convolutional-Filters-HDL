module mean (
    input logic [7:0] p1, p2, p3, p4, p5, p6, p7, p8, p9,
    output logic [7:0] new_pixel
);

always_comb
begin

    new_pixel = ( (p1*1) + (p2*1) + (p3*1) + (p4*1) + (p5*1) + (p6*1) + (p7*1) + (p8*1) + (p9*1) ) / 9;

end
    
endmodule