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

- enable - приём по одному биту информации bit_in за каждый такт clk;
- num_end - сигнал, сообщающий о завершении передачи числа;
- res_out - результат деления переданного числа на 3.

![Task2](https://user-images.githubusercontent.com/91137374/165484690-c6251de3-76de-4db3-8233-10c35ea52a55.png)

**Схемотехника**:

![sch2](https://user-images.githubusercontent.com/91137374/165488605-a149484a-9dc3-4a17-8230-fbda101bdfdf.png)

**Временные диаграммы**:

![Task2_time](https://user-images.githubusercontent.com/91137374/165488920-1103d188-afa2-43ce-b8fe-0e20926e91a7.png)

**Task №3**

**Условие задачи**: 

Реализовать КИХ фильтр, 3 отсчета, размерность 8 бит, знаковые числа. Вход поступает каждые 10 тактов, размерность 8 бит, знаковые целые числа.
Допускается использовать один (два*) физический умножитель. Обосновать размерность результата.

**Описание работы модуля**:

На вход поступают три 8-битных входных сигнала и три 8-битных коэффициентов фильтра. Сигнал может поступать каждые 2 такта. Уравнение КИХ-фильтра:

result = a0x0 + a1x1 + a2x2 + a3x3 - 18-битное знаковое целое число

z = a0x0 + a1x1

enable - запуск расчёта КИХ-фильтра

**Схемотехника**:

![sch3](https://user-images.githubusercontent.com/91137374/167150285-a10b26c7-2fbc-4613-98ca-1f2b85f6b8fd.png)

**Временные диаграммы**:

![Task3_time](https://user-images.githubusercontent.com/91137374/167149173-58dfa6c3-0b6a-4117-acef-dcb68065cc5c.png)

**Task №4**

**Условие задачи**: 

Реализовать физический уровень приемника SPI Peripheral с поддержкой операции записи. SPI интерфейс содержит 4 провода – SCK, CS, COPI, CIPO.
Формат команды - Команда   Адрес     Данные  
                 7 ... 0   23 ... 0  31 ... 0
Команда записи может быть любая фиксированная. Все остальные значения этого поля необходимо игнорировать.  
На выход ожидается примерно следующий интерфейс:  
output wire wr_en_out,  
output wire [31:0] wr_data_out,  
output wire [23:0] wr_address_out,  

**Описание работы модуля**:


**Схемотехника**:


**Временные диаграммы**:



