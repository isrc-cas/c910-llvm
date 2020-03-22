//===-- RISCVInstrInfoC910.td - C910 Instruction Info ---*- tablegen -*-===//
//
//
//===----------------------------------------------------------------------===//
// Instruction Formats
//===----------------------------------------------------------------------===//
include "RISCVInstrFormatsC910.td"

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

def FF0 : BO_2<0b10000,10,"ff0">;
def FF1 : BO_2<0b10000,11,"ff1">;
def REV : BO_2<0b10000,01,"rev">;
def REVW : BO_2<0b10010,00,"revw">;
def TSTNBZ : BO_2<0b10000,00,"tstnbz">;

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

def MULAH : CS_1<0b00101,00,"mulah">;
def MULAW : CS_1<0b00100,10,"mulaw">;
def MULS : CS_1<0b00100,01,"muls">;
def MULSH : CS_1<0b00101,01,"mulsh">;
def MULSW : CS_1<0b00100,11,"mulsw">;
def MVEQZ : CS_1<0b00100,00,"mveqz">;
def MVNEZ : CS_1<0b01000,01,"mvnez">;

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


