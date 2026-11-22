# neetcode-go

NeetCode（Akky版 Blind 75 → NeetCode 150）を Go で解いた記録です。

- 進捗: [PROGRESS.md](PROGRESS.md)
- 1問 = 1フォルダ（`problems/<カテゴリ>/<番号>-<slug>/`）。中身は解答・テスト・解法メモの3点です

## 構成

```
problems/
  arrays-hashing/
    0217-contains-duplicate/
      solution.go        # 解答
      solution_test.go   # テーブル駆動テスト
      README.md          # 解法を一言で・計算量・詰まった点・記録
scripts/new.sh           # 雛形を作るスクリプト
PROGRESS.md              # 進捗表
```

## 使い方

```sh
# 1. 雛形を作る（番号はLeetCodeの問題番号）
./scripts/new.sh arrays-hashing 217 contains-duplicate Easy

# 2. solution.go と solution_test.go を書く

# 3. テスト
go test ./problems/arrays-hashing/0217-contains-duplicate/
go test ./...          # 全部

# 4. コミット
git add -A && git commit -m "solve: 217 contains-duplicate"
```

## 週のサイクル（4日新規＋2日復習＋1日テスト）

| 曜日 | やること | コミット |
|---|---|---|
| 新規4日 | 1日5問。3〜5分考えて分からなければ答えを見て、その日の夜までに再現 | `solve: <番号> <slug>` |
| 復習2日 | その週の20問を何も見ずに書き直す。PROGRESS.md の「復習」「結果」を埋める | `review: <番号> <slug>` |
| テスト1日 | ランダムに数問を時間を計って解く | `test: week N` |

復習で書き直すときは、`solution.go` の中身を消してから書くと「再現できるか」がそのまま確認できます。前の解答は `git diff` や履歴で見比べられます。

## カテゴリ

`arrays-hashing` `two-pointers` `sliding-window` `stack` `binary-search` `linked-list` `trees` `tries` `heap` `backtracking` `graphs` `advanced-graphs` `1d-dp` `2d-dp` `greedy` `intervals` `math-geometry` `bit-manipulation`
