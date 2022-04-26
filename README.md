# -HomeWork-System_Engineering
*Задания по курсу: "Системотехника электронно-вычислительных средств":*

**Task №1**

**Условие задачи**: Реализовать модуль комплексного умножения. Каждые 4 (3*) такта на вход поступают 2 комплексных числа, размеры действительной и 
мнимой частей составляют 8 бит, знаковые целые числа. Допускается использовать один физический умножитель. Обосновать размерность результата. 

**Описание работы модуля**:
На вход поступают два 8-битных комплексных числа. Алгоритм комплексного умножения:

z = a1xa2 - b1xb2 + a1xb2(i) + a2xb1(i)

z = z0 - z1 + z2 + z3 - 16-битное комплексное число

z = result_real + result_imag

**Схемотехника**:

![sch1](https://user-images.githubusercontent.com/91137374/164090398-25e3ce51-7259-4fa2-b7d3-644db6fb409e.png)

**Временные диаграммы**:

![Timing](https://user-images.githubusercontent.com/91137374/164089380-aa78ff3c-53bb-4b08-8216-cf0acb966009.png)

**Task №2**

**Условие задачи**: 

- Разработать схему для определения, делится ли число на 3;
- Входом в схему будет один бит;
- Каждый такт новое значение помещается в младший бит числа;
- На выходе схемы должна быть логическая 1, если полученное двоичное число делится на 3.

**Описание работы модуля**:


**Схемотехника**:



**Временные диаграммы**:

