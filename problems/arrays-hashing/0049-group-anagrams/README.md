# 49. group-anagrams (Medium)

- 問題: https://leetcode.com/problems/group-anagrams/
- NeetCode: https://neetcode.io/problems/group-anagrams
- カテゴリ: arrays-hashing

## 解法を一言で
英字カウントをキー、文字列スライスを値としたmapオブジェクトを作成。
その後、値を文字列スライスへ置き換えてあげれば良い。

## 計算量

- 時間: O(n*k)
- 空間: O(n*k)

## 詰まった点・覚えること
### mapのvalueの取り出し方
素直にfor-rangeループ

### mapのvalueがスライスの場合の、代入方法
``` go
m[k] = append(m[k], value)
```
これで、mapのkeyに対応するvalueのスライスにappendできる

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| 2026-11-23 | 新規 | △ | 解法というより、goの書き方で詰まった|
| 2026-11-27 | 復習 | ⚪︎ | |
| 2026-11-28 | 復習 | ⚪︎ | |
