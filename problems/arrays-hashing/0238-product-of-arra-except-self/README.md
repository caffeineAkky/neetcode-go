# 238. product-of-arra-except-self (Medium)

- 問題: https://leetcode.com/problems/product-of-array-except-self/
- NeetCode: https://neetcode.io/problems/product-of-array-except-self
- カテゴリ: arrays-hashing

## 解法を一言で
各numsのインデックスにおいて、左の積の配列と、右の積の配列を作成しておく。
そのあと、左の積と右の積の積を求めると、自身以外の積を求めることができる

## 計算量

- 時間: O(n)
- 空間: O(n)

## 詰まった点・覚えること
### メモ
単純に考えたら、2重のforで回して、内側forで自分以外をスキップさせてかけたものをメモリ保持→最後にスライスにappendするやり方。

だけど、これだと同じ掛け算が何回も出てきてしまう。

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| 2026-11-24 | 新規 | △ | |
