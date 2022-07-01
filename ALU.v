module ALU(
input wire [7:0] A, B,
input wire [3:0] cntrl,
output wire [7:0] Result
    );
    reg [7:0] res;
    always @(*) begin
        case(cntrl)
        4'b1001: res = A << B; //SLL
        default: res = 8'bx;	//using the ALU that was used in class
        endcase 
        end
    assign Result = res;   
endmodule