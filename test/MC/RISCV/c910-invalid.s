# RUN: not llvm-mc -triple riscv64 -mcpu=c910  < %s 2>&1 | FileCheck %s

# Too few operands
rev a0  # CHECK: :[[@LINE]]:1: error: too few operands for instruction
revw a0  # CHECK: :[[@LINE]]:1: error: too few operands for instruction
ff0 a0  # CHECK: :[[@LINE]]:1: error: too few operands for instruction
ff1 a0  # CHECK: :[[@LINE]]:1: error: too few operands for instruction

