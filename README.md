# LISP Practice

## Envirement :
    ubuntu 18.04 LTS

## Install
```
$ sudo apt-get install sbcl
```

### problem 1_1

先定義一個名為 prime 的 function, 吃一個 parameter “number”
先令 x = 1, 接下來進入迴圈, 從 i=2 跑到 i >= number 停止
迴圈中不斷讓 number mod i, 若 number mod i == 0 代表有數可以整除 number
所以 number 不是質數, 就把 x 改成 2
反之, 若 number mod i 始終不為 0, 代表 number 為質數, x == 1
最後, 若 x==1 則印出該 number 為 prime
反之, 若 x==2 則印出該 number 不為 prime

**Commend line**
```
$ sbcl --script F74052154 problem1_1.lsp
```
**Output**
2 is prime
239 is prime 
999 is not prime
17 is prime 

### problem 1_2

先定義一個名為 palindrome 的 function, 吃一個 parameter “list”
進入後先確定 list 是否為空
若為空直接印出 NIL is palindrome
若不為空, 就先將 list 的值 assign 給變數 ttt
接著把 ttt reverse, 在判斷 ttt 和 list 是否相同
若相同則印出該 list 為 palindrome
若不同則印出該 list 不為 palindrome

**Commend line**
```
$ sbcl --script problem1_2.lsp
```
**Output** 

(A B C) is not palindrome 
(M A D A M) is palindrome 
(CAT DOG) is not palindrome 
NIL is palindrome 
(CAT DOG BIRD BIRD DOG CAT) is palindrome

### problem 1_3

fib1 function : 
吃一個 parameter “n”
若 n < 2, 代表到底部了, n-2 會變成負數, 所以直接 return n
若 n >=2, 因為第 n 項相當於第 n-1 項 + 第 n-2 項, 因此 return fib1(n-1) + fib1(n-2)

tailfib function :
吃三個 parameter 分別為 “n”  “a”  “b”
n 代表第幾項其實也代表他要做幾次, a 為第前兩項的數字, b 為第前一項的數字
每一次的 call tailfib function 就是為了求出下一項 (將前兩項相加), 因此
若 n = 0, 代表已經把需要的次數做完, 原本的 a 即為答案
若 n != 0, 代表還需要求出下一項, 因此 call tailfib ((n-1)  b  (a+b))
其中三個參數代表
1. 還需要做 n-1 次
2. 下一項的第前兩項為該次的第前一項  : b
3. 下一項的第前一項為該次算出的項 : a+b

fib2 function :
吃一個 parameter “n”, 代表要取得第幾項的值
所以直接 call tailfib 並給予初始參數 (n 0 1)
1. n 為要第幾項
2. 0 為第 0 項的值
3. 1 為第 1 項的值
藉此可以一直找到第 n 項的值

**Commend line**
```
$ sbcl --script problem1_3.lsp
```

**Output**
0: (FIB1 3)
    1: (FIB1 2)
        2: (FIB1 1)
        2: FIB1 returned 1
        2: (FIB1 0)
        2: FIB1 returned 0
    1: FIB1 returned 1
    1: (FIB1 1)
    1: FIB1 returned 1
0: FIB1 returned 2
0: (FIB2 8)
0: FIB2 returned 21


### problem 2

main function : 
讀取 input , call function mergesort, parameter  “numbers”, “number” 為讀取的 list

mergesort function : 
吃一個 parameter “numbers”, “numbers” main function 讀進來的 list
這個 function 主要是將 list 切成兩半,
所以先檢查 “numbers” 的長度是否 <= 1
1. 長度 <= 1,  直接 return number, 因為只有一個, 不需要再做排序
2. 長度 > 1, 可以再切, 所以就把 numbers 分成 left 和 right 兩部份
    接著再分別把 left 和 right 放入 mergesort 做排序, 在此同時
    把 mergsort 的結果餵給 my_merge function, 做把兩個list 照順序 merge 的動作

my_merge function :
吃 3 個 parameter ( left right  length )
其中 left 和 right 是 list , length 是 left 和 right 的總長度
再來, 先建一個空 list : result
接下來的 merge 結果都會放進 result 這個 list
做迴圈 length 次
若已經做了 length 次, 因為merge 完的結果會是大到小排列
因此, 要把 result reverse 後再 return

迴圈 ：
    先分成三個部份
    1. left 為空
    那就直接把 right 的第一個 element 塞進 result
    2. right 為空
    那就直接把 left 的第一個 element 塞進 result
    3. left 和 right 不為空
    先判斷 left 和 right 的第一個 element 哪個小
    比較小的就先塞進 result
    接著繼續迴圈
**Commend line**
```
$ sbcl --script problem2.lsp
```
**Output**
input 1 :
3
3 2 1

input 2 :
5
1 3 8 9 1

input 3 :
10
9 8 16 2 7 199 0 98 1 29

output 1 : 
1 2 3

output 2 : 
1 1 3 8 9

output 3 : 
0 1 2 7 8 9 16 29 98 199

### problem 3

readfile function : 
吃兩個 parameter (path my_list)
其中 path 為 file 的路徑, my_list 為檔案的逐行程式碼
先根據 path 開檔, 並把檔案資訊放在 in 中
把 my_list 初始為 nil
接著將檔案逐行放入 my_list 中
因為放入 my_list 時順序會前後顛倒
所以先將 my_list 做 reverse 後再 return

lcs function :
吃兩個 parameter ( file1 file2)
其中 file1 file2 分別為兩個檔案的逐行程式碼
接著分成三種情況
1. file1 和 file2 都為空
直接不做事

2. file1 和 file2 的第一個 element 相同
那就 file1 的第一個 element 就是 lcs 的其中一個元素
接著就等待 file1 和 file2 剩下的元素做 lcs function 後的回傳值（一串剩下的 lcs）, 串起來

3. file1 和 file2 的第一個 element 不相同
這邊又分成兩種情況
	1. 用 file1 和 不包含第一個 element 的 file2 做 lcs
	2. 用不包含第一個 element 的 file1 和  file2 做 lcs
但因兩種情況可能會產生不同的 lcs
因此只取其中最長的一種
最後會得到兩個 file 間的共同程式碼


diff function : 
吃三個 parameter ( file1 file2 lcs)
其中 file1 file2 為一開始讀入的檔案的逐行程式碼, lcs 則為兩個 file 間的共同程式碼, 他們都是 list
迴圈  1 ：
中止條件為 file1 和 file2 皆為空

	迴圈2 :
	若 （ file1 的第一個element 和 lcs 的第一個 element 相同 ） 或（file1 為空）就把 file1 的第一個 	elemt pop 掉, 並且跳出迴圈 2
	若上述條件不成立, 就把 file1 的第一個 element 印出來
	因為是第一個檔案, 所以會印出前面帶有 – 號的紅色程式碼
	並且將 file1 剩下的部份繼續做迴圈 2

	迴圈 3 :
	若 （ file2 的第一個element 和 lcs 的第一個 element 相同 ） 或（file2 為空）就把 file2 的第一個 	elemt pop 掉, 然後印出 lcs 的第一個 element , 並且把 lcs 的第一個 element pop 掉
	最後跳出迴圈 3
	若上述條件不成立, 就把 file2 的第一個 element 印出來
	因為是第二個檔案, 所以會印出前面帶有 + 號的綠色程式碼
	並且將 file2 剩下的部份繼續做迴圈 3

main function : 
call readfile function 分別把兩個檔案讀進 file1 file2
call diff function (file1 file2 lcs)
其中 lcs 為 file1 file2 的共同程式碼 list

**Commend line**
```
$ sbcl --script problem3.lsp
```

**Output**

-#include <stdio.h>
+#include <iostream>
+using namespace std;
 int main() {
-    printf(“Hello World”);
+    cout << “Hello World” << end;
     return 0;
 }