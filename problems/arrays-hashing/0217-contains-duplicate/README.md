# 217. contains-duplicate (Easy)

- 問題: https://leetcode.com/problems/contains-duplicate/
- NeetCode: https://neetcode.io/problems/contains-duplicate
- カテゴリ: arrays-hashing

## 解法を一言で
setオブジェクトを作成して、2回目に出現した値の場合にtrueを返してあげる

## 計算量

- 時間: O(n)
- 空間: O(b)

## 詰まった点・覚えること
###  setオブジェクトの作り方
    1. map[key]bool{} または make(map[key]bool)
    2. map[key]struce{}{}

### make(map~)とmap~の違い
make()は、スライス・map・チャネル専用の組み込み関数。
この3つは中身を管理するための内部構造を持っていて、それを準備してから使う必要があるため、makeで初期化している。

``` go
s  := make([]int, 3)        // スライス：長さ3、中身は [0 0 0]
s2 := make([]int, 0, 10)    // スライス：長さ0、容量10
m  := make(map[int]bool)    // map：空
m2 := make(map[int]bool, 100) // map：100要素くらい入る見込み
ch := make(chan int)        // チャネル
```

{}との使い分けは、makeだとサイズを先に指定できるところ。初期値を入れたいときは{}。

### var と := の違い
初期値を書くなら、どちらも型推論が効くので、出来上がる変数は一緒。

1. := は関数の中でしか使えない。

2. varは型の明示や、初期値なしの宣言ができる

3. := は複数代入の時に既存の変数を再利用できる

使い分けの慣習
- 関数内で値を入れて作る → :=（ほとんどこれ）
- ゼロ値から始めたい → var（例：var sum int、var result []int）
- 型を明示したい、パッケージレベルで宣言する → var

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| 2026-11-23 | 新規 | △ | setを使う発想は良かったが、goの書き方がわからなかった |
