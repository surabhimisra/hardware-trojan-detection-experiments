🧪 Experiment 1 — Baseline ALU vs Trojan-Inserted ALU
📘 Objective

The goal of this experiment is to evaluate the functional impact of a rare-trigger Hardware Trojan inserted into an 8-bit ALU.
We compare:

A clean baseline ALU, and

A Trojan-inserted ALU with a hidden trigger and malicious payload.

This experiment demonstrates how Trojans can remain inactive under ordinary test patterns yet misbehave under specific rare input conditions.

🔧 1. Baseline Design: simple_alu

The reference ALU supports four operations:

Opcode	Operation	Description
00	ADD	a + b
01	SUB	a - b
10	AND	a & b
11	OR	`a

The baseline ALU produces correct functional results for all input combinations.

🐞 2. Trojan-Inserted Design: trojan_alu

The Trojan-inserted version mirrors the baseline ALU, but includes:

✔ Trigger Condition (rare input pattern)

The Trojan activates only when:

opcode == 2'b11

a == 8'hA5

b == 8'h5A

This pattern is extremely unlikely to appear in typical functional testing or random simulation.

Trigger logic:
assign trojan_trigger = (opcode == 2'b11) &&
                        (a == 8'hA5) &&
                        (b == 8'h5A);

✔ Payload (malicious behavior)

When triggered:

The output y is forced to 8'h00

This corrupts the functionality while remaining silent in all other scenarios

Payload snippet:
if (trojan_trigger)
    y = {WIDTH{1'b0}};   // malicious override
else
    y = y_baseline;


This represents a functional disruption Trojan.

🧪 3. Testbench Setup

The testbench alu_compare_tb.v instantiates:

simple_alu (clean)

trojan_alu (malicious)

Both receive identical stimulus.

The test covers:

Normal/random input cases

Non-trigger OR operations

The exact rare Trojan-triggering input pattern

A VCD file (alu_compare.vcd) is dumped for waveform viewing.

📊 4. Simulation Results

Console output:

VCD info: dumpfile alu_compare.vcd opened for output.
Time | opcode a      b      | y_clean y_trojan | Note
-------------------------------------------------------------
10000 |  00   0a   03   |   0d      0d   | add
20000 |  01   0f   07   |   08      08   | sub
30000 |  10   f0   0f   |   00      00   | and
40000 |  11   aa   55   |   ff      ff   | or (non-trigger)
50000 |  11   a5   5a   |   ff      00   | *** TROJAN TRIGGER ***
Simulation finished.

✔ Normal Inputs (no Trojan activation)

For the first four test vectors:

Clean ALU output = Trojan ALU output

No observable deviation

Trojan remains fully hidden

This mimics real-world Trojans that evade standard verification.

🔥 Trojan Trigger Case

At time 50000:

opcode = 11  
a      = A5  
b      = 5A  

Expected (clean):

A5 OR 5A = FF

Trojan output:

00

The Trojan has activated and corrupted the output.

This demonstrates:

Correctly functioning trigger

Malicious payload

Functional divergence only during the triggering condition

🔍 5. Interpretation & Security Relevance

This experiment highlights key properties of RTL-level Hardware Trojans:

✔ Stealth

The Trojan is dormant for nearly all inputs.
A typical random or directed test suite is unlikely to catch it.

✔ Rare-Event Trigger

The trigger is chosen so the Trojan evades functional verification and ATPG tests.

✔ Payload Impact

Corrupted output can:

Leak data

Break control logic

Introduce incorrect computation

Cause system-level failure

✔ Why This Matters

Real Trojans are designed exactly this way:

Hidden behind obscure states

Triggered by carefully crafted events

Affecting functionality only when activated

This is the foundation for more advanced detection experiments.

🗂 6. Files Used

src/rtl/simple_alu.v

src/rtl/trojan_alu.v

src/testbench/alu_compare_tb.v

alu_compare.vcd (generated waveform)
