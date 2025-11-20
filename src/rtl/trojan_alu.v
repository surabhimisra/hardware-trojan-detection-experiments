// src/rtl/trojan_alu.v
// ALU with a simple Hardware Trojan inserted.
// Same interface and baseline behavior as simple_alu,
// but a rare trigger pattern corrupts the output.
//
// Trigger example (rare in normal testing):
//  - opcode == 2'b11
//  - a == 8'hA5
//  - b == 8'h5A
//
// Payload:
//  - Force output y to 8'h00 (incorrect result)

module trojan_alu #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire [1:0]       opcode,
    output reg  [WIDTH-1:0] y,
    output wire             zero
);

    // Internal signal for baseline ALU result
    reg [WIDTH-1:0] y_baseline;

    // Baseline ALU behavior (same as simple_alu)
    always @(*) begin
        case (opcode)
            2'b00: y_baseline = a + b;
            2'b01: y_baseline = a - b;
            2'b10: y_baseline = a & b;
            2'b11: y_baseline = a | b;
            default: y_baseline = {WIDTH{1'b0}};
        endcase
    end

    // Trojan trigger: rare input combination
    wire trojan_trigger;
    assign trojan_trigger = (opcode == 2'b11) &&
                            (a == 8'hA5) &&
                            (b == 8'h5A);

    // Payload: corrupt output when triggered
    always @(*) begin
        if (trojan_trigger) begin
            // Malicious behavior
            y = {WIDTH{1'b0}};   // force zero (incorrect)
        end else begin
            // Normal ALU behavior
            y = y_baseline;
        end
    end

    assign zero = (y == {WIDTH{1'b0}});

endmodule

