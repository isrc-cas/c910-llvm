# RUN: llvm-mc %s -triple=riscv64 -mcpu=c910 -riscv-no-aliases -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: ext a0, a1, 4, 1
# CHECK-ASM: encoding: [0x0b,0xa5,0x25,0x20]
ext a0, a1, 4, 1

# CHECK-ASM-AND-OBJ: extu a0, a1, 5, 1
# CHECK-ASM: encoding: [0x0b,0xb5,0x25,0x28]
extu a0, a1, 5, 1

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

# CHECK-ASM-AND-OBJ: tst a0, a1, 1
# CHECK-ASM: encoding: [0x0b,0x95,0x25,0x88]
tst a0, a1, 1

# CHECK-ASM-AND-OBJ: tstnbz a0, a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x80]
tstnbz a0, a1

# CHECK-ASM-AND-OBJ: mula a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x20]
mula a1, a2, a3

# CHECK-ASM-AND-OBJ: addsl a1, a2, a3, 1
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x02]
addsl a1, a2, a3, 1

# CHECK-ASM-AND-OBJ: mulah a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x28]
mulah a1, a2, a3

# CHECK-ASM-AND-OBJ: mulaw a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x20]
mulaw a1, a2, a3

# CHECK-ASM-AND-OBJ: muls a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x22]
muls a1, a2, a3

# CHECK-ASM-AND-OBJ: mulsh a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x2a]
mulsh a1, a2, a3

# CHECK-ASM-AND-OBJ: mulsw a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x20]
mulsw a1, a2, a3

# CHECK-ASM-AND-OBJ: mveqz a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x20]
mveqz a1, a2, a3

# CHECK-ASM-AND-OBJ: mvnez a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x42]
mvnez a1, a2, a3

# CHECK-ASM-AND-OBJ: srri a0, a1, 4
# CHECK-ASM: encoding: [0x0b,0x95,0x45,0x10]
srri a0, a1, 4

# CHECK-ASM-AND-OBJ: srriw a0, a1, 3
# CHECK-ASM: encoding: [0x0b,0x95,0x35,0x14]
srriw a0, a1, 3

# CHECK-ASM-AND-OBJ: sync
# CHECK-ASM: encoding: [0x0b,0x00,0x80,0x01]
sync

# CHECK-ASM-AND-OBJ: sync_i
# CHECK-ASM: encoding: [0x0b,0x00,0xa0,0x01]
sync_i

# CHECK-ASM-AND-OBJ: sync_is
# CHECK-ASM: encoding: [0x0b,0x00,0xb0,0x01]
sync_is

# CHECK-ASM-AND-OBJ: sync_s
# CHECK-ASM: encoding: [0x0b,0x00,0x90,0x01]
sync_s

