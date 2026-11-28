# 125. valid-palindrome (Easy)

- 問題: https://leetcode.com/problems/valid-palindrome/
- NeetCode: https://neetcode.io/problems/valid-palindrome
- カテゴリ: two-pointers

## 解法を一言で
Two Pointersっぽく書くなら、左右どちらかが判定対象の文字列になるまでスキップして、どちらも判定対象なら判定して進めていく。判定がOKで終わったらtrueを返す。

## 計算量

- 時間: O(n)
- 空間: O(1)

## 詰まった点・覚えること
### 初期の考え
1. 文字列から不要な文字を消し、小文字にする
2. 文字列の長さ(length)を取得
3. forでlenの半分までループ
    1. s[i]とs[length-1-i]が一致しない場合、false
    2. 一致する場合、続ける

### stringのrangeループ
indexとruneが返却される。

### なぜGoではstringではなくruneで返されるのか
stringはメモリを確保して、16バイト使用する。

しかしruneであれば数値のみで4バイトで済むので容量を少なくできる。

しかも、runeが数値であることで文字の範囲チェックなどを数値計算できるようになる。

### unicode
``` go
unicode.IsLetter(r) //runeを引数に、runeが文字かboolを返す
unicode.IsDigit(r)  //runeを引数に、runeが数値かboolを返す
unicode.Tolower(r)  //runeを引数に、小文字のruneを返却する
```

### stringsBuilder
``` go
sb.WriteRune(r) //runeを引数に、stringsBuilderにruneを追加する
```
なお、sbにはWriteRuneした後にWriteStringとかしても問題ないらしい。
中身がただのバイト列だから。

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| 2026-11-26 | 新規 | × | |
| 2026-11-27 | 復習 | △ | 一度は見たけど、ほぼノールック |
| 2026-11-27 | 復習 | ⚪︎ | |
| 2026-11-28 | 復習 | ⚪︎ | |
