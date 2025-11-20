Research Overview: Hardware Trojan Detection & Security-Aware RTL Design
1. Introduction

This repository explores Hardware Trojans and security-aware design techniques at the Register-Transfer Level (RTL).
As digital systems and SoCs become more complex, untrusted design steps, third-party IP, and distributed fabrication increase the risk of malicious circuit modifications. Hardware Trojans can be small, stealthy, and extremely difficult to detect once embedded into a chip.

The goal of this project is to build a clear, hands-on framework for understanding how Hardware Trojans behave, how they are inserted, and how they can be analyzed at the RTL stage.

2. Project Scope

This repository focuses on:

RTL-level Hardware Trojan insertion

Trigger mechanisms (rare-event, combinational, sequential)

Payload behaviors that modify outputs or internal states

Logic locking and key-based protection

Testbench-driven evaluation

Waveform and output comparison between clean and modified designs

All experiments are fully reproducible using open-source simulation tools.

3. Motivation

Hardware security is an increasingly important area in digital design and verification. Understanding Trojans at the RTL helps engineers and researchers:

See how malicious behavior can be hidden inside conventional logic

Understand how Trojans can remain undetected during verification

Study trigger patterns and activation conditions

Explore countermeasures such as logic locking or structural analysis

Build intuition on how subtle changes affect system behavior

This repository acts as a learning space and experimentation environment for anyone interested in hardware trust and secure chip design.

4. Current Experiments
Experiment 1 — Rare-Trigger Trojan in an 8-bit ALU

Implements a clean ALU and a Trojan-modified version

Trojan triggers under a specific input pattern

Demonstrates how outputs diverge only in rare conditions

Includes VCD waveforms and a comparison testbench

Experiment 2 — Logic Locking (in progress)

Adds XOR- and XNOR-based key gates

Compares locked vs unlocked behavior

Studies how incorrect keys affect functionality

Future planned experiments:

Side-channel oriented analysis (toggle-rate based)

Counter-based and state-machine-based Trojans

Automated Trojan insertion scripts

Interaction between logic locking and Trojans

5. Repository Structure

The project is organized to keep experiments, RTL, scripts, and documentation cleanly separated:

src/
    rtl/            # Baseline and modified RTL modules
    testbench/      # Testbenches for functional verification

experiments/
    logic_locking/  # Logic locking studies
    trojan_insertion/ # Trojan behavior experiments

scripts/            # Simulation and automation utilities

results/
    waveforms/      # VCD files and traces
    reports/        # Experiment summaries, plots, notes

docs/
    notes.md        # Research notes, ideas, reading summaries

6. Tools Used

Verilog RTL

Icarus Verilog (iverilog)

Verilator (optional)

GTKWave for waveform analysis

Python (planned for automation and data extraction)

7. Long-Term Goals

As the project grows, it will include:

More complex Trojans with layered triggers

Scripts for inserting Trojans automatically into designs

Simulation harnesses that generate randomized tests

Detection-oriented experiments

Documentation and analysis notebooks

Examples suitable for workshops, training, or teaching semiconductor security concepts

8. Conclusion

This repository provides a practical, experiment-driven approach to understanding Hardware Trojans and secure RTL design techniques.
By combining baseline designs, Trojan-inserted variants, logic locking approaches, and testbench-driven evaluation, it offers a hands-on environment to study how malicious modifications can be inserted, triggered, and analyzed within digital circuits.
