📘 Hardware Trojan Detection Experiments

A Research-Oriented Repository for Security-Aware RTL Design, Logic Locking, and Hardware Trojan Analysis

🔍 Overview
This repository contains a structured set of experiments, RTL designs, testbenches, and analysis workflows for Hardware Trojan detection, logic locking, and security-aware RTL design.

The goal is to explore and evaluate methodologies used to detect malicious modifications in digital integrated circuits—an increasingly critical challenge in modern semiconductor supply chains.

This project supports research on:
1. Hardware Trojan insertion, activation, and payload behavior
2. Trigger mechanisms (combinational, sequential, rare-event)
3. Logic locking techniques for obfuscation and Trojan mitigation
4. Detection through functional testing, side-channel insights, and structural analysis
5. Best practices for building security-aware ASIC RTL

These experiments form the foundation for research papers, academic outreach, and open-source hardware security resources.

🧠 Motivation
As semiconductor designs grow larger and supply chains more distributed, detecting malicious modifications has become a national security priority.

Trojan-inserted silicon can compromise:
1. Cloud and datacenter infrastructure
2. Network security appliances
3. Defense and aerospace systems
4. Critical national infrastructure

This repository contributes reproducible experiments, baseline RTL, and documented methodologies aligned with:
1. Academic hardware security research
2. Open-source learning
3. Early-career contributions to the field

hardware-trojan-detection-experiments
    ── src/
        ── rtl/               # Clean RTL designs (baseline modules)
        ── testbench/         # Testbenches for simulations
    ── experiments/
      ── logic_locking/     # XOR/XNOR locking, key-based obfuscation
      ── trojan_insertion/  # Trojan variations, triggers, payloads
    ── scripts/               # Simulation scripts (iverilog/verilator/python)
    ── results/
       ── waveforms/         # VCD waveform dumps
       ── reports/           # Markdown/PDF experiment summaries
    ── docs/
        ── notes.md           # Research notes and reading summaries


🧪 Experiments Included
1. Trojan Insertion Experiments
    Combinational vs. sequential Trojans
    Rare-event triggers
    Counter-based triggers
    Payloads affecting:
        Arithmetic unit correctness
        FSM transitions
        Output corruption
        Covert data leakage
    Each experiment includes:
        RTL module
        Trojan-inserted variant
        Testbench
    Observations and results

2. Logic Locking Experiments
    XOR-based locking
    XNOR-based locking
    Key-based control logic
    Locked vs. unlocked functional comparison
    Security evaluation under Trojan presence

▶️ Running Simulations
Using Icarus Verilog (iverilog)
iverilog -o sim.out src/rtl/module.v src/testbench/module_tb.v
vvp sim.out

Using Verilator
verilator --cc module.v --exe module_tb.cpp
make -C obj_dir -j
./obj_dir/Vmodule

Waveforms will be saved in results/waveforms/*.vcd.


📚 Research Notes & Documentation
The docs/ directory contains:
    Hardware Trojan taxonomy
    Logic locking overview
    Key research papers and summaries
    Experiment design notes
    Reading list for future work
    This will be expanded as new experiments are added.

🧩 Future Work
Planned additions:
    Side-channel leakage experiments (toggle-rate profiling)
    Trojan activation probability modeling
    Layout-aware Trojan exploration (post-synthesis)
    Integration with Python-based analysis
    Experiment reports in PDF format
    Open-source datasets for teaching & outreach

🤝 Contributions & Collaboration
This repository is part of a broader effort to explore security-aware hardware design and contribute to the open hardware security community.
Researchers, students, and practitioners are welcome to:
    Discuss ideas
    Suggest experiments
    Contribute improvements
    Share related work

📄 License
MIT License
Free for academic and research use.

⭐ If you find this useful, consider starring the repo!
