module mux2_1(
    input [7:0] A,
    input [7:0] B,
    input sel,
    output [7:0] q
    );
    
    assign q = sel ? B : A;
endmodule
