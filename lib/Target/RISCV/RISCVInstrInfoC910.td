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

//let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
//def TST : RVInstC910BO_3<0b100010, OPC_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs1, simm12:$imm6),
//                            "tst", "$rd, $rs1, $imm6">;     //???立即数的类型定义      
