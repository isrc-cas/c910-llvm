# RUN: llvm-mc %s -triple=riscv64 -mcpu=c910 --mattr=+c910 -riscv-no-aliases -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: ext a0,a1,4,1
# CHECK-ASM: encoding: [0x0b,0xa5,0x25,0x20]
ext a0,a1,4,1

# CHECK-ASM-AND-OBJ: extu a0,a1,5,1
# CHECK-ASM: encoding: [0x0b,0xb5,0x25,0x28]
extu a0,a1,5,1

# CHECK-ASM-AND-OBJ: ff0 a0, a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x80]
ff0 a0, a1

# CHECK-ASM-AND-OBJ: ff1 a0, a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x80]
ff1 a0, a1

# CHECK-ASM-AND-OBJ: rev a0, a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x82]
rev a0, a1

# CHECK-ASM-AND-OBJ: revw a0, a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x90]
revw a0, a1

# CHECK-ASM-AND-OBJ: tst a0,a1,1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x88]
tst a0,a1,1

# CHECK-ASM-AND-OBJ: tstnbz a0,a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x80]
tstnbz a0,a1
