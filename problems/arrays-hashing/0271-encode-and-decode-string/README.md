# 271. encode-and-decode-string (Medium)

- 問題: https://leetcode.com/problems/encode-and-decode-strings/
- NeetCode: https://neetcode.io/problems/encode-and-decode-strings
- カテゴリ: arrays-hashing

## 解法を一言で
どうすればエンコードとデコードをどんな場合であってもできるのか？を考えた時、数字＋区切り文字という2つの情報を文字列に加える必要があることに気が付く。(文字列の中に区切り文字がいた場合、そこで区切られてしまうため)

## 計算量

- 時間: O(n)
- 空間: O(n)

## 詰まった点・覚えること
### for文
``` go
for i < len(string)
```
のように、for と条件だけ指定してループできる。他言語でいうwhile文

### IntとStringの型変換方法
strvonvをimportして、Itoa(int)またはAtoi(string)をする。
なお、Atoi(string)には値とエラーの2つの返却値があるため、エラーが不要な場合には捨てる必要がある。

### string builder
文字列を結合させる方法として、string builderがある。
``` go
var sb strings.Builder
```
として、ストリングビルダー型の変数を作成。
その後、文字を追加するときは
``` go
sb.WeriteString(string)
```
として文字列を追加する。
最後、作成された文字列を取得したいときは
``` go
result := sb.String()
```
とする。

なぜこう書くのか？

理由は、ループ内でこれまで作成していたstringに、次のスライス要素を文字列結合して足していく方法だと遅いから。
遅くなる理由は、goの文字列はイミュータブルのため、毎回stringの箱が作り直されるため。

string→毎回箱を作り直し、前の結果をコピーして作成してから足したものを新たに作成

builder→1回ごとに後ろに付け加えていくだけ。バッファがある。中身は[]byteで、書き換えても良い。空いているところに書いていって、容量がなくなったときだけ倍の量を要求する。

### 範囲指定して文字列を切り抜く
``` go
start := 2
end := 5
str := "authentic"
cut := str[start:end]

fmt.Println(cut) // the
```
これで、文字列が

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| 2026-11-24 | 新規 | | |
