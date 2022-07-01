module forwarding_unit(
    input [7:0] EX_instr,
    input [7:0] WB_instr,
    output reg sel
    );
    always @(*) begin
        //case -> li and sll
        if((WB_instr[7:6] == 2'b00) && (EX_instr[7:6] == 2'b01)) begin
            if(WB_instr[5:3] == EX_instr[5:3]) sel = 1; //forwarding condition
        end
  
        else
            sel = 0; //otherwise sel = 0
    end
endmodule
