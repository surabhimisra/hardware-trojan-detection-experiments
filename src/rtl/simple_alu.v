// src/rtl/simple_alu.v
// Baseline ALU (no Trojan)
// Operations:
//  00 -> a + b
//  01 -> a - b
//  10 -> a & b
//  11 -> a | b

module simple_alu #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire [1:0]       opcode,
    output reg  [WIDTH-1:0] y,
    output wire             zero
);

    always @(*) begin
        case (opcode)
            2'b00: y = a + b;
            2'b01: y = a - b;
            2'b10: y = a & b;
            2'b11: y = a | b;
            default: y = {WIDTH{1'b0}};
        endcase
    end

    assign zero = (y == {WIDTH{1'b0}});

endmodule

