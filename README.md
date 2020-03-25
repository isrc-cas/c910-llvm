# c910-llvm

本项目目标是基于LLVM，实现对平头哥玄铁C910指令集架构的支持。玄铁 C910在RISCV标准指令集架构的基础上，增加了自定义指令，包括 Cache 指令子集，同步指令子集，算术运算指令子集，位操作指令子集以及存储指令子集。本项目主要工作是在RISCV后端实现这些扩展指令支持。

以下按照不同指令子集扩展列出已实现llvm-mc汇编器支持的指令。

**同步指令子集**

| 指令    | 描述             | 状态                    |
| ------- | ---------------- | ----------------------- |
| SYNC    | 同步指令         | :ballot_box_with_check: |
| SYNC.I  | 同步清空指令     | :ballot_box_with_check: |
| SYNC.IS | 同步清空广播指令 | :ballot_box_with_check: |
| SYNC.S  | 同步广播指令     | :ballot_box_with_check: |

**算术运算指令子集**

| 指令  | 描述                 | 状态                    |
| ----- | -------------------- | ----------------------- |
| ADDSL | 寄存器移位相加指令   | :ballot_box_with_check: |
| MULA  | 乘累加指令           | :ballot_box_with_check: |
| MULAH | 低 16 位乘累加指令   | :ballot_box_with_check: |
| MULAW | 低 32 位乘累加指令   | :ballot_box_with_check: |
| MULS  | 乘累减指令           | :ballot_box_with_check: |
| MULSH | 低 16 位乘累减指令   | :ballot_box_with_check: |
| MULSW | 低 32 位乘累减指令   | :ballot_box_with_check: |
| MVEQZ | 寄存器为 0 传送指令  | :ballot_box_with_check: |
| MVNEZ | 寄存器非 0 传送指令  | :ballot_box_with_check: |
| SRRI  | 循环右移指令         | :ballot_box_with_check: |
| SRRIW | 低 32 位循环右移指令 | :ballot_box_with_check: |

**位操作指令子集**

| 指令 | 描述                           | 状态                    |
| ---- | ------------------------------ | ----------------------- |
| EXT  | 寄存器连续位提取符号位扩展指令 | :ballot_box_with_check: |
| EXTU | 寄存器连续位提取零扩展指令     | :ballot_box_with_check: |
| FF0  | 快速找 0 指令                  | :ballot_box_with_check: |
| FF1  | 快速找 1 指令                  | :ballot_box_with_check: |
| REV  | 字节倒序指令                   | :ballot_box_with_check: |
| REVW | 低 32 位字节倒序指令           | :ballot_box_with_check: |
| TST  | 比特为 0 测试指令              | :ballot_box_with_check: |

**存储指令子集**

| 指令  | 描述                                     | 状态                    |
| ----- | ---------------------------------------- | ----------------------- |
| FLRD  | 浮点寄存器移位双字加载指令               | :ballot_box_with_check: |
| FLRW  | 浮点寄存器移位字加载指令                 | :ballot_box_with_check: |
| FLURD | 浮点寄存器低 32 位移位双字加载指令       | :ballot_box_with_check: |
| FLURW | 浮点寄存器低 32 位移位字加载指令         | :ballot_box_with_check: |
| LRB   | 寄存器移位符号位扩展字节加载指令         | :ballot_box_with_check: |
| LRH   | 寄存器移位符号位扩展半字加载指令         | :ballot_box_with_check: |
| LRW   | 寄存器移位符号位扩展字加载指令           | :ballot_box_with_check: |
| LRD   | 寄存器移位双字加载指令                   | :ballot_box_with_check: |
| LRBU  | 寄存器移位零扩展字节加载指令             | :ballot_box_with_check: |
| LRHU  | 寄存器移位零扩展半字加载指令             | :ballot_box_with_check: |
| LRWU  | 寄存器移位零扩展字加载指令               | :ballot_box_with_check: |
| LURB  | 寄存器低 32 位移位符号位扩展字节加载指令 | :ballot_box_with_check: |
| LURH  | 寄存器低 32 位移位符号位扩展半字加载指令 | :ballot_box_with_check: |
| LURW  | 寄存器低 32 位移位符号位扩展字加载指令   | :ballot_box_with_check: |
| LURD  | 寄存器低 32 位移位双字加载指令           | :ballot_box_with_check: |
| LURBU | 寄存器低 32 位移位零扩展字节加载指令     | :ballot_box_with_check: |
| LURHU | 寄存器低 32 位移位零扩展半字加载指令     | :ballot_box_with_check: |
| LURWU | 寄存器低 32 位移位零扩展字加载指令       | :ballot_box_with_check: |
| LBIA  | 符号位扩展字节加载基地址自增指令         | :ballot_box_with_check: |
| LBIB  | 基地址自增符号位扩展字节加载指令         | :ballot_box_with_check: |
| LHIA  | 符号位扩展半字加载基地址自增指令         | :ballot_box_with_check: |
| LHIB  | 基地址自增符号位扩展半字加载指令         | :ballot_box_with_check: |
| LWIA  | 符号位扩展字加载基地址自增指令           | :ballot_box_with_check: |
| LWIB  | 基地址自增符号位扩展字加载指令           | :ballot_box_with_check: |
| LDIA  | 符号位扩展双字加载基地址自增指令         | :ballot_box_with_check: |
| LDIB  | 基地址自增符号位扩展双字加载指令         | :ballot_box_with_check: |
| LBUIA | 零扩展字节加载基地址自增指令             | :ballot_box_with_check: |
| LBUIB | 基地址自增零扩展字节加载指令             | :ballot_box_with_check: |
| LHUIA | 零扩展半字加载基地址自增指令             | :ballot_box_with_check: |
| LHUIB | 基地址自增零扩展半字加载指令             | :ballot_box_with_check: |
| LWUIA | 零扩展字加载基地址自增指令               | :ballot_box_with_check: |
| LWUIB | 基地址自增零扩展字加载指令               | :ballot_box_with_check: |
| LDD   | 双寄存器加载指令                         | :ballot_box_with_check: |
| LWD   | 符号位扩展双寄存器字加载指令             | :ballot_box_with_check: |
| LWUD  | 零扩展双寄存器字加载指令                 | :ballot_box_with_check: |
| FSRD  | 浮点寄存器移位双字存储指令               | :ballot_box_with_check: |
| FSRW  | 浮点寄存器移位字存储指令                 | :ballot_box_with_check: |
| FSUSR | 浮点寄存器低 32 位移位双字存储指令       | :ballot_box_with_check: |
| FSURW | 浮点寄存器低 32 位移位字存储指令         | :ballot_box_with_check: |
| SRB   | 寄存器移位字节存储指令                   | :ballot_box_with_check: |
| SRH   | 寄存器移位半字存储指令                   | :ballot_box_with_check: |
| SRW   | 寄存器移位字存储指令                     | :ballot_box_with_check: |
| SRD   | 寄存器移位双字存储指令                   | :ballot_box_with_check: |
| SURB  | 寄存器低 32 位移位字节存储指令           | :ballot_box_with_check: |
| SURH  | 寄存器低 32 位移位半字存储指令           | :ballot_box_with_check: |
| SURW  | 寄存器低 32 位移位字存储指令             | :ballot_box_with_check: |
| SURD  | 寄存器低 32 位移位双字存储指令           | :ballot_box_with_check: |
| SBIA  | 字节存储基地址自增指令                   | :ballot_box_with_check: |
| SBIB  | 基地址自增字节存储指令                   | :ballot_box_with_check: |
| SHIA  | 半字存储基地址自增指令                   | :ballot_box_with_check: |
| SHIB  | 基地址自增半字存储指令                   | :ballot_box_with_check: |
| SWIA  | 字存储基地址自增指令                     | :ballot_box_with_check: |
| SWIB  | 基地址自增字存储指令                     | :ballot_box_with_check: |
| SDIA  | 双字存储基地址自增指令                   | :ballot_box_with_check: |
| SDIB  | 基地址自增双字存储指令                   | :ballot_box_with_check: |
| SDD   | 双寄存器存储指令                         | :ballot_box_with_check: |
| SWD   | 双寄存器低 32 位存储指令                 | :ballot_box_with_check: |

**编译及执行测试用例：**

```
$ cd c910-llvm
$ mkdir build
$ cd build
$ cmake -DLLVM_TARGETS_TO_BUILD="RISCV" -DLLVM_ENABLE_PROJECTS=clang  -G "Unix Makefiles" ../llvm
$ make

$ ./bin/llvm-lit -v ../llvm/test/MC/RISCV/c910-valid.s
```

**c910指令汇编生成二进制文件：**

```
 $ ./bin/llvm-mc test.s -triple=riscv64 -mcpu=c910 -show-encoding -show-inst --filetype=obj -o=test.o
```



