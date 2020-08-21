# RUN: llvm-mc %s -triple=riscv64 -mcpu=c910 -riscv-no-aliases -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: ext a0, a1, 4, 1
# CHECK-ASM: encoding: [0x0b,0xa5,0x15,0x10]
ext a0, a1, 4, 1

# CHECK-ASM-AND-OBJ: extu a0, a1, 5, 1
# CHECK-ASM: encoding: [0x0b,0xb5,0x15,0x14]
extu a0, a1, 5, 1

# CHECK-ASM-AND-OBJ: ff0 a0, a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x84]
ff0 a0, a1

# CHECK-ASM-AND-OBJ: ff1 a0, a1
# CHECK-ASM: encoding: [0x0b,0x95,0x05,0x86]
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
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x24]
mulaw a1, a2, a3

# CHECK-ASM-AND-OBJ: muls a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x22]
muls a1, a2, a3

# CHECK-ASM-AND-OBJ: mulsh a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x2a]
mulsh a1, a2, a3

# CHECK-ASM-AND-OBJ: mulsw a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x26]
mulsw a1, a2, a3

# CHECK-ASM-AND-OBJ: mveqz a1, a2, a3
# CHECK-ASM: encoding: [0x8b,0x15,0xd6,0x40]
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


# CHECK-ASM-AND-OBJ: flrd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xe5,0xc5,0x62]
flrd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: flrw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xe5,0xc5,0x42]
flrw a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: flurd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xe5,0xc5,0x72]
flurd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: flurw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xe5,0xc5,0x52]
flurw a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: fsrd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xf5,0xc5,0x62]
fsrd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: fsrw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xf5,0xc5,0x42]
fsrw a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: fsurd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xf5,0xc5,0x72]
fsurd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: fsurw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xf5,0xc5,0x52]
fsurw a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lrb a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x02]
lrb a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lrbu a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x82]
lrbu a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lrd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x62]
lrd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lrh a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x22]
lrh a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lrhu a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0xa2]
lrhu a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lrw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x42]
lrw a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lrwu a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0xc2]
lrwu a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lurb a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x12]
lurb a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lurbu a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x92]
lurbu a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lurd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x72]
lurd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lurh a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x32]
lurh a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lurhu a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0xb2]
lurhu a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lurw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0x52]
lurw a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: lurwu a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xc5,0xc5,0xd2]
lurwu a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: srb a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x02]
srb a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: srd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x62]
srd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: srh a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x22]
srh a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: srw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x42]
srw a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: surb a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x12]
surb a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: surd a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x72]
surd a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: surh a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x32]
surh a0, a1, a2, 1

# CHECK-ASM-AND-OBJ: surw a0, a1, a2, 1
# CHECK-ASM: encoding: [0x0b,0xd5,0xc5,0x52]
surw a0, a1, a2, 1


# CHECK-ASM-AND-OBJ: lbia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x18]
lbia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lbib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x08]
lbib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lbuia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x98]
lbuia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lbuib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x88]
lbuib a0, (a1), 1, 4


# CHECK-ASM-AND-OBJ: ldia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x78]
ldia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: ldib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x68]
ldib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lhia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x38]
lhia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lhib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x28]
lhib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lhuia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0xb8]
lhuia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lhuib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0xa8]
lhuib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lwia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x58]
lwia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lwib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0x48]
lwib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lwuia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0xd8]
lwuia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: lwuib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xc5,0x15,0xc8]
lwuib a0, (a1), 1, 4


# CHECK-ASM-AND-OBJ: sbia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x18]
sbia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: sbib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x08]
sbib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: sdia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x78]
sdia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: sdib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x68]
sdib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: shia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x38]
shia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: shib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x28]
shib a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: swia a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x58]
swia a0, (a1), 1, 4

# CHECK-ASM-AND-OBJ: swib a0, (a1), 1, 4
# CHECK-ASM: encoding: [0x0b,0xd5,0x15,0x48]
swib a0, (a1), 1, 4


# CHECK-ASM-AND-OBJ: ldd a2, 0(a1)
# CHECK-ASM: encoding: [0x0b,0xc6,0x05,0xf8]
ldd a2, 0(a1)

# CHECK-ASM-AND-OBJ: lwd a2, 0(a1)
# CHECK-ASM: encoding: [0x0b,0xc6,0x05,0xe0]
lwd a2, 0(a1)

# CHECK-ASM-AND-OBJ: lwud a2, 0(a1)
# CHECK-ASM: encoding: [0x0b,0xc6,0x05,0xf0]
lwud a2, 0(a1)

# CHECK-ASM-AND-OBJ: sdd a2, 0(a1)
# CHECK-ASM: encoding: [0x0b,0xd6,0x05,0xf8]
sdd a2, 0(a1)

# CHECK-ASM-AND-OBJ: swd a2, 0(a1)
# CHECK-ASM: encoding: [0x0b,0xd6,0x05,0xe0]
swd a2, 0(a1)


# CHECK-ASM-AND-OBJ: dcache_call
# CHECK-ASM: encoding: [0x0b,0x00,0x10,0x00]
dcache_call

# CHECK-ASM-AND-OBJ: dcache_iall
# CHECK-ASM: encoding: [0x0b,0x00,0x20,0x00]
dcache_iall

# CHECK-ASM-AND-OBJ: icache_iall
# CHECK-ASM: encoding: [0x0b,0x00,0x00,0x01]
icache_iall

# CHECK-ASM-AND-OBJ: icache_ialls
# CHECK-ASM: encoding: [0x0b,0x00,0x10,0x01]
icache_ialls

# CHECK-ASM-AND-OBJ: l2cache_call
# CHECK-ASM: encoding: [0x0b,0x00,0x50,0x01]
l2cache_call

# CHECK-ASM-AND-OBJ: l2cache_ciall
# CHECK-ASM: encoding: [0x0b,0x00,0x70,0x01]
l2cache_ciall

# CHECK-ASM-AND-OBJ: l2cache_iall
# CHECK-ASM: encoding: [0x0b,0x00,0x60,0x01]
l2cache_iall


# CHECK-ASM-AND-OBJ: dcache_ciall
# CHECK-ASM: encoding: [0x0b,0x00,0xb0,0x00]
dcache_ciall

# CHECK-ASM-AND-OBJ: dcache_cipa a1
# CHECK-ASM: encoding: [0x0b,0x80,0xb5,0x02]
dcache_cipa a1

# CHECK-ASM-AND-OBJ: dcache_cisw a1
# CHECK-ASM: encoding: [0x0b,0x80,0x35,0x02]
dcache_cisw a1

# CHECK-ASM-AND-OBJ: dcache_civa a2
# CHECK-ASM: encoding: [0x0b,0x00,0x76,0x02]
dcache_civa a2

# CHECK-ASM-AND-OBJ: dcache_cpa a3
# CHECK-ASM: encoding: [0x0b,0x80,0x96,0x02]
dcache_cpa a3

# CHECK-ASM-AND-OBJ: dcache_cpal1 a2
# CHECK-ASM: encoding: [0x0b,0x00,0x86,0x02]
dcache_cpal1 a2

# CHECK-ASM-AND-OBJ: dcache_cva a2
# CHECK-ASM: encoding: [0x0b,0x00,0x56,0x02]
dcache_cva a2

# CHECK-ASM-AND-OBJ: dcache_cval1 a2
# CHECK-ASM: encoding: [0x0b,0x00,0x46,0x02]
dcache_cval1 a2

# CHECK-ASM-AND-OBJ: dcache_ipa a2
# CHECK-ASM: encoding: [0x0b,0x00,0xa6,0x02]
dcache_ipa a2

# CHECK-ASM-AND-OBJ: dcache_isw a2
# CHECK-ASM: encoding: [0x0b,0x00,0x26,0x02]
dcache_isw a2

# CHECK-ASM-AND-OBJ: dcache_iva a2
# CHECK-ASM: encoding: [0x0b,0x00,0x66,0x02]
dcache_iva a2

# CHECK-ASM-AND-OBJ: icache_ipa a3
# CHECK-ASM: encoding: [0x0b,0x80,0x86,0x03]
icache_ipa a3

# CHECK-ASM-AND-OBJ: icache_iva a3
# CHECK-ASM: encoding: [0x0b,0x80,0x06,0x03]
icache_iva a3


