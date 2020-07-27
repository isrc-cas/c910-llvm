//===-- RISCVInstrInfoC910.td - C910 Instruction Info ---*- tablegen -*-===//
//
//
//===----------------------------------------------------------------------===//
// Instruction Formats
//===----------------------------------------------------------------------===//
include "RISCVInstrFormatsC910.td"


//===----------------------------------------------------------------------===//
// Bit Operation extension instruction formats
//===----------------------------------------------------------------------===//
let hasSideEffects = 1, mayLoad = 0, mayStore = 0 in {
def EXT : RVInstC910BO_1<0b010, OPC_CUSTOM0, 
                            (outs GPR:$rd), (ins GPR:$rs1, simm12:$imm1, simm12:$imm2),
                            "ext", "$rd, $rs1, $imm1, $imm2">;
def EXTU : RVInstC910BO_1<0b011, OPC_CUSTOM0, 
                            (outs GPR:$rd), (ins GPR:$rs1, simm12:$imm1, simm12:$imm2),
                            "extu", "$rd, $rs1, $imm1, $imm2">;
}   

//===----------------------------------------------------------------------===//
// Instruction Class Templates
//===----------------------------------------------------------------------===//
let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
class BO_2<bits<5> funct5, bits<2> funct2, string opcodestr>
    : RVInstC910BO_2<funct5, funct2, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1),
              opcodestr, "$rd, $rs1">;                         

def FF0    : BO_2<0b10000, 0b10, "ff0">;
def FF1    : BO_2<0b10000, 0b11, "ff1">;
def REV    : BO_2<0b10000, 0b01, "rev">;
def REVW   : BO_2<0b10010, 0b00, "revw">;
def TSTNBZ : BO_2<0b10000, 0b00, "tstnbz">;

let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
def TST : RVInstC910BO_3<0b100010, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, simm12:$imm6),
                            "tst", "$rd, $rs1, $imm6">;    

//===----------------------------------------------------------------------===//
// Computation and Sync Operation extension instruction formats
//===----------------------------------------------------------------------===//

def MULA : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Size = 4;
    let Inst{31-27} = 0b00100; //funct5
    let Inst{26-25} = 0b00; //funct2
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001; //funct3
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; //opcode
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "mula\t$rd, $rs1, $rs2";
}

//===----------------------------------------------------------------------===//


let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
class CS_1<bits<5> funct5, bits<2> funct2, string opcodestr>
    : RVInstC910CS_1<funct5, funct2, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
              opcodestr, "$rd, $rs1, $rs2">;

def MULAH : CS_1<0b00101, 0b00, "mulah">;
def MULAW : CS_1<0b00100, 0b10, "mulaw">;
def MULS  : CS_1<0b00100, 0b01, "muls">;
def MULSH : CS_1<0b00101, 0b01, "mulsh">;
def MULSW : CS_1<0b00100, 0b11, "mulsw">;
def MVEQZ : CS_1<0b01000, 0b00, "mveqz">; //Note:the instruction bits are incorrect in previous C910 ISA manual, which will cause encoding conflict.
def MVNEZ : CS_1<0b01000, 0b01, "mvnez">;

def ADDSL : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    bits<2> imm2;
    let Namespace = "RISCV";
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Size = 4;
    let Inst{31-27} = 0b00000; //funct5
    let Inst{26-25} = imm2; //
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001; //funct3
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; //opcode
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2, simm12:$imm2);
    let AsmString = "addsl\t$rd, $rs1, $rs2, $imm2";
}

def SRRI : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs1;
    bits<5> rd;
    bits<6> imm6;
    let Namespace = "RISCV";
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Size = 4;
    let Inst{31-26} = 0b000100; //funct6
    let Inst{25-20} = imm6; //
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001; //funct3
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; //opcode
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, simm12:$imm6);
    let AsmString = "srri\t$rd, $rs1, $imm6";
}

def SRRIW : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs1;
    bits<5> rd;
    bits<5> imm5;
    let Namespace = "RISCV";
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Size = 4;
    let Inst{31-25} = 0b0001010; //funct7
    let Inst{24-20} = imm5; //
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001; //funct3
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0001011; //opcode
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, simm12:$imm5);
    let AsmString = "srriw\t$rd, $rs1, $imm5";
}

let hasSideEffects = 1, mayLoad = 0, mayStore = 0 in
class CS_2<bits<5> funct5, string opcodestr> 
    : RVInstC910CS_2<funct5, OPC_CUSTOM0, (outs), (ins),
               opcodestr, "">;                         

def SYNC : CS_2<0b11000, "sync">;
def SYNC_I : CS_2<0b11010, "sync_i">;
def SYNC_IS : CS_2<0b11011, "sync_is">;
def SYNC_S : CS_2<0b11001, "sync_s">;

//===----------------------------------------------------------------------===//
// Loads & Stores extension instruction formats 
//===----------------------------------------------------------------------===//

let hasSideEffects = 0, mayLoad = 1, mayStore = 0 in
class Load_fl<bits<5> funct5, string opcodestr>
    : RVInstC910LS_1<funct5, 0b110, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, simm12:$imm2),
              opcodestr, "$rd, $rs1, $rs2, $imm2">;

let hasSideEffects = 0, mayLoad = 1, mayStore = 0 in
class Load_ll<bits<5> funct5, string opcodestr>
    : RVInstC910LS_1<funct5, 0b100, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, simm12:$imm2),
              opcodestr, "$rd, $rs1, $rs2, $imm2">;

let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
class Store_fs<bits<5> funct5, string opcodestr>
    : RVInstC910LS_1<funct5, 0b111, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, simm12:$imm2),
              opcodestr, "$rd, $rs1, $rs2, $imm2">;

let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
class Store_ss<bits<5> funct5, string opcodestr>
    : RVInstC910LS_1<funct5, 0b101, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, simm12:$imm2),
              opcodestr, "$rd, $rs1, $rs2, $imm2">;


let hasSideEffects = 0, mayLoad = 1, mayStore = 0 in
class Load_ab<bits<5> funct5, string opcodestr>
    : RVInstC910LS_2<funct5, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, simm12:$imm5, simm12:$imm2),
              opcodestr, "$rd, (${rs1}), $imm5, $imm2">;

let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
class Store_ab<bits<5> funct5, string opcodestr>
    : RVInstC910LS_4<funct5, OPC_CUSTOM0, (outs GPR:$rs2), (ins GPR:$rs1, simm12:$imm5, simm12:$imm2),
              opcodestr, "$rs2, (${rs1}), $imm5, $imm2">;

let hasSideEffects = 0, mayLoad = 1, mayStore = 0 in
class Load_ld<bits<5> funct5, string opcodestr>
    : RVInstC910LS_3<funct5, 0b100, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, simm12:$imm7),
              opcodestr, "$rd, ${imm7}(${rs1})">;

let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
class Store_sd<bits<5> funct5, string opcodestr>
    : RVInstC910LS_3<funct5, 0b101, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, simm12:$imm7),
              opcodestr, "$rd, ${imm7}(${rs1})">;

def FLRD : Load_fl<0b01100, "flrd">;
def FLRW : Load_fl<0b01000, "flrw">;
def FLURD : Load_fl<0b01110, "flurd">;
def FLURW : Load_fl<0b01010, "flurw">;

def FSRD : Store_fs<0b01100, "fsrd">;
def FSRW : Store_fs<0b01000, "fsrw">;
def FSURD : Store_fs<0b01110, "fsurd">;
def FSURW : Store_fs<0b01010, "fsurw">;

def LRB : Load_ll<0b00000, "lrb">;
def LRBU : Load_ll<0b10000, "lrbu">;
def LRD : Load_ll<0b01100, "lrd">;
def LRH : Load_ll<0b00100, "lrh">;
def LRHU : Load_ll<0b10100, "lrhu">;
def LRW : Load_ll<0b01000, "lrw">;
def LRWU : Load_ll<0b11000, "lrwu">;
def LURB : Load_ll<0b00010, "lurb">;
def LURBU : Load_ll<0b10010, "lurbu">;
def LURD : Load_ll<0b01110, "lurd">;
def LURH : Load_ll<0b00110, "lurh">;
def LURHU : Load_ll<0b10110, "lurhu">;
def LURW : Load_ll<0b01010, "lurw">;
def LURWU : Load_ll<0b11010, "lurwu">;

def SRB : Store_ss<0b00000, "srb">;
def SRD : Store_ss<0b01100, "srd">;
def SRH : Store_ss<0b00100, "srh">;
def SRW : Store_ss<0b01000, "srw">;
def SURB : Store_ss<0b00010, "surb">;
def SURD : Store_ss<0b01110, "surd">;
def SURH : Store_ss<0b00110, "surh">;
def SURW : Store_ss<0b01010, "surw">;


def LBIA : Load_ab<0b00011, "lbia">;
def LBIB : Load_ab<0b00001, "lbib">;
def LBUIA : Load_ab<0b10011, "lbuia">;
def LBUIB : Load_ab<0b10001, "lbuib">;
def LDIA : Load_ab<0b01111, "ldia">;
def LDIB : Load_ab<0b01101, "ldib">;
def LHIA : Load_ab<0b00111, "lhia">;
def LHIB : Load_ab<0b00101, "lhib">;
def LHUIA : Load_ab<0b10111, "lhuia">;
def LHUIB : Load_ab<0b10101, "lhuib">;
def LWIA : Load_ab<0b01011, "lwia">;
def LWIB : Load_ab<0b01001, "lwib">;
def LWUIA : Load_ab<0b11011, "lwuia">;
def LWUIB : Load_ab<0b11001, "lwuib">;


def SBIA : Store_ab<0b00011, "sbia">;
def SBIB : Store_ab<0b00001, "sbib">;
def SDIA : Store_ab<0b01111, "sdia">;
def SDIB : Store_ab<0b01101, "sdib">;
def SHIA : Store_ab<0b00111, "shia">;
def SHIB : Store_ab<0b00101, "shib">;
def SWIA : Store_ab<0b01011, "swia">;
def SWIB : Store_ab<0b01001, "swib">;


def LDD : Load_ld<0b11111, "ldd">;
def LWD : Load_ld<0b11100, "lwd">;
def LWUD : Load_ld<0b11110, "lwud">;

def SDD : Store_sd<0b11111, "sdd">;
def SWD : Store_sd<0b11100, "swd">;

//===----------------------------------------------------------------------===//
// cache extension instruction set 
//===----------------------------------------------------------------------===//
let hasSideEffects = 1, mayLoad = 0, mayStore = 0 in
class CACHE_1<bits<5> funct5, string opcodestr>
    : RVInstC910CACHE_1<funct5, OPC_CUSTOM0, (outs), (ins),
               opcodestr, "">;

def DCACHE_CALL : CACHE_1<0b00001, "dcache_call">;
def DCACHE_IALL : CACHE_1<0b00010, "dcache_iall">;
def ICACHE_IALL : CACHE_1<0b10000, "icache_iall">;
def ICACHE_IALLS : CACHE_1<0b10001, "icache_ialls">;
def L2CACHE_CALL : CACHE_1<0b10101, "l2cache_call">;
def L2CACHE_CIALL : CACHE_1<0b10111, "l2cache_ciall">;
def L2CACHE_IALL : CACHE_1<0b10110, "l2cache_iall">;
def DCACHE_CIALL : CACHE_1<0b01011, "dcache_ciall">;


let hasSideEffects = 1, mayLoad = 0, mayStore = 1 in
class CACHE_2<bits<5> funct5,  string opcodestr>
    : RVInstC910CACHE_2<funct5,  OPC_CUSTOM0, (outs), (ins GPR:$rs1),
              opcodestr, "$rs1">;

def DCACHE_CIPA : CACHE_2<0b01011, "dcache_cipa">;
def DCACHE_CISW : CACHE_2<0b00011, "dcache_cisw">;
def DCACHE_CIVA : CACHE_2<0b00111, "dcache_civa">;
def DCACHE_CPA : CACHE_2<0b01001, "dcache_cpa">;
def DCACHE_CPAL1 : CACHE_2<0b01000, "dcache_cpal1">;
def DCACHE_CVA : CACHE_2<0b00101, "dcache_cva">;
def DCACHE_CVAL1 : CACHE_2<0b00100, "dcache_cval1">;
def DCACHE_IPA : CACHE_2<0b01010, "dcache_ipa">;
def DCACHE_ISW : CACHE_2<0b00010, "dcache_isw">;
def DCACHE_IVA : CACHE_2<0b00110, "dcache_iva">;
def ICACHE_IPA : CACHE_2<0b11000, "icache_ipa">;
def ICACHE_IVA : CACHE_2<0b10000, "icache_iva">;


