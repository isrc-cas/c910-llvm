//===-- RISCVInstrFormatsC910.td - C910 Instruction Extensions Formats ---*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// This file describes the C910 extension instruction formats.
// 
//===----------------------------------------------------------------------===//


// Bit Operation extension instruction formats

//include "RISCVInstrFormats.td"

// The following opcode name match the "custom-0" that given in Table 19.1 in the
// RISC-V User-level ISA specification ("RISC-V base opcode map").
def OPC_CUSTOM0  : RISCVOpcode<0b0001011>;

class RVInstC910BO_1<bits<3> funct3, RISCVOpcode opcode,
               dag outs, dag ins, string opcodestr, string argstr>
    : RVInst<outs, ins, opcodestr, argstr, [], InstFormatOther> {

  bits<5> imm1;
  bits<6> imm2;
  bits<6> rs1;
  bits<5> rd;

  let Inst{31-27} = imm1;
  let Inst{26-21} = imm2;
  let Inst{20-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7}  = rd;
  let Opcode = opcode.Value;
}

class RVInstC910BO_2<bits<5> funct5, bits<2> funct2, RISCVOpcode opcode,
               dag outs, dag ins, string opcodestr, string argstr>
    : RVInst<outs, ins, opcodestr, argstr, [], InstFormatOther> {
  bits<6> rs1;
  bits<5> rd;

  let Inst{31-27} = funct5;
  let Inst{26-25} = funct2;
  let Inst{24-21} = 0b0000;
  let Inst{20-15} = rs1;
  let Inst{14-12} = 0b001;
  let Inst{11-7}  = rd;
  let Opcode = opcode.Value;
}

class RVInstC910BO_3<bits<6> funct6, RISCVOpcode opcode,
               dag outs, dag ins, string opcodestr, string argstr>
    : RVInst<outs, ins, opcodestr, argstr, [], InstFormatOther> {
  bits<5> imm6;  
  bits<6> rs1;
  bits<5> rd;

  let Inst{31-26} = funct6;
  let Inst{25-21} = imm6;
  let Inst{20-15} = rs1;
  let Inst{14-12} = 0b001;
  let Inst{11-7}  = rd;
  let Opcode = opcode.Value;
}



