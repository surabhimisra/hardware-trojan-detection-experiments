// src/testbench/alu_compare_tb.v
// Testbench to compare simple_alu and trojan_alu.
//
// - Applies a few normal vectors (should match).
// - Applies the Trojan trigger vector (should mismatch).
// - Prints results and creates a VCD waveform dump.

`timescale 1ns/1ps

module alu_compare_tb;

    localparam WIDTH = 8;

    reg  [WIDTH-1:0] a;
    reg  [WIDTH-1:0] b;
    reg  [1:0]       opcode;

    wire [WIDTH-1:0] y_clean;
    wire             zero_clean;

    wire [WIDTH-1:0] y_trojan;
    wire             zero_trojan;

    // Instantiate baseline ALU
    simple_alu #(
        .WIDTH(WIDTH)
    ) u_clean (
        .a(a),
        .b(b),
        .opcode(opcode),
        .y(y_clean),
        .zero(zero_clean)
    );

    // Instantiate Trojan-inserted ALU
    trojan_alu #(
        .WIDTH(WIDTH)
    ) u_trojan (
        .a(a),
        .b(b),
        .opcode(opcode),
        .y(y_trojan),
        .zero(zero_trojan)
    );

    integer i;

    initial begin
        // VCD dump for waveforms
        $dumpfile("alu_compare.vcd");
        $dumpvars(0, alu_compare_tb);

        $display("Time | opcode a      b      | y_clean y_trojan | Note");
        $display("-------------------------------------------------------------");

        // 1) Normal operations – random-ish values, no Trojan trigger

        opcode = 2'b00; a = 8'd10; b = 8'd3; #10;
        $display("%4t |  %b   %h   %h   |   %h      %h   | add",
                 $time, opcode, a, b, y_clean, y_trojan);

        opcode = 2'b01; a = 8'd15; b = 8'd7; #10;
        $display("%4t |  %b   %h   %h   |   %h      %h   | sub",
                 $time, opcode, a, b, y_clean, y_trojan);

        opcode = 2'b10; a = 8'hF0; b = 8'h0F; #10;
        $display("%4t |  %b   %h   %h   |   %h      %h   | and",
                 $time, opcode, a, b, y_clean, y_trojan);

        opcode = 2'b11; a = 8'hAA; b = 8'h55; #10;
        $display("%4t |  %b   %h   %h   |   %h      %h   | or (non-trigger)",
                 $time, opcode, a, b, y_clean, y_trojan);

        // 2) Trojan trigger pattern
        opcode = 2'b11; a = 8'hA5; b = 8'h5A; #10;
        $display("%4t |  %b   %h   %h   |   %h      %h   | *** TROJAN TRIGGER ***",
                 $time, opcode, a, b, y_clean, y_trojan);

        $display("Simulation finished.");
        #10;
        $finish;
    end

endmodule

