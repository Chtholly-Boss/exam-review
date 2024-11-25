#import "utils.typ":*

== 目标代码生成

=== 开销计算
该题型在作业和考试中均有出现，属于送分题型。

本课程的开销定义为：
- 指令固定开销：1
- 寄存器操作开销：0， 如 R, \*R(即取寄存器中的值)
- 其他操作开销：1
  - 如取常数, \#2
  - 如从非寄存器变量取值(寻址): \*a

#btw[按原书的说法，大致可以理解为寄存器可以和指令码一起放在一个word中，而其他信息(如常数)需要紧跟在这个word后面，使用一个额外的word来存储，因此需要额外开销]

#synex([
  (2023深圳) 计算下面程序的开销：
  #align(center)[
    ```yasm
      MOV x, R0
      MOV y, R1
      ADD R0, R1
    ```
  ]
  Sol: 3(指令数) + 2(x, y) = 5
])

#synex([
  (hw2) 计算下面程序的开销：
  #align(center)[
    ```yasm
      MOV p, R0
      MOV 0(R0), R1
      MOV R1, x
    ```
  ]
  Sol: 3(指令数) + 3(p, 0, x) = 6
])

=== 概念解释
本章涉及了部分概念，需要简单过一遍，考试时能描述大意即可。

#figure(
  image("./assets/活动记录.png"),
  caption: "活动记录"
) <event>

#ex([
  - (2023深圳) 调用序列是指 #ans([负责分配活动记录，并将相关信息填入活动记录中的代码序列])
  - (2023深圳) 返回序列是指 #ans([负责恢复机器状态，使调用过程继续执行的代码序列])
])

// 可能考察的概念解释：
// - 代码生成的任务是 #ans[把中间代码转换为等价的、具有较高质量的目标代码，以充分利用目标机器的资源]
// - 代码生成器的输入包括 #ans[中间代码] 和 #ans[符号表信息]
// - 目标代码的形式主要有 #ans[绝对机器语言代码] 、 #ans[可重定位机器语言代码] 以及 #ans[汇编语言代码]
// - 指令选择是指 #ans[寻找一个合适的机器指令序列来实现给定的中间代码]。
// - 寄存器分配是指 #ans[为程序的某一点选择驻留在寄存器的一组变量]
// - 寄存器指派是指 #ans[确定变量将要驻留的具体寄存器]
// - 后续引用信息是指 #ans[变量在基本块中是否还会再被引用以及会在哪里被引用]

