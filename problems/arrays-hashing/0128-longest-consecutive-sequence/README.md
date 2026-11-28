# 128. longest-consecutive-sequence (Medium)

- 問題: https://leetcode.com/problems/longest-consecutive-sequence/
- NeetCode: https://neetcode.io/problems/longest-consecutive-sequence
- カテゴリ: arrays-hashing

## 解法を一言で
出てきた値をsetで記憶しておき、ループを回して始点となる値がきた場合だけ繋がる分カウント。最後に一番大きい連続数を返却する。

## 計算量

- 時間: O(n)
- 空間: O(n)

## 詰まった点・覚えること
### 愚直解
1. ソート
2. 差が0→何もしない
3. 差が1→列が続く
4. それ以外→列が途切れる

### 昇順ソート
``` go
import "slices"

slices.Sort(nums)
```

### 降順ソート
``` go
import (
    "cmp"
    "slices"
)

slices.SortFunc(nums, func(a, b int) int {
    return cmp.Compare(b, a)
})
```

### 2数値で大きい方を取得する関数
``` go
res = max(res, cnt)
```
### mapのループ
``` go
for k, v := range map {
    // k = key, v = value
}
```

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| 2026-11-24 | 新規 | × | |
| 2026-11-27 | 復習 | △ | |
| 2026-11-27 | 復習 | ⚪︎ | |
| 2026-11-28 | 復習 | △ | |
