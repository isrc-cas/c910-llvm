# RUN: not llvm-mc -triple riscv64 < %s 2>&1 | FileCheck %s

# c910 instructions can't be used for RV32


