# 347. top-k-frequent-elements (Medium)

- 問題: https://leetcode.com/problems/top-k-frequent-elements/
- NeetCode: https://neetcode.io/problems/top-k-frequent-elements
- カテゴリ: arrays-hashing

## 解法を一言で
その値が取りうる範囲が
1. 整数
2. 最小値と最大値が前もってわかる
3. その幅が十分小さい
場合、バケットソートを使用して、大きい順に出現した値をk個スライスに入れて返却する

## 計算量

- 時間: O(n)
- 空間: O(n)

## 詰まった点・覚えること

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| 2026-11-23 | 新規 | × | バケットソート |
