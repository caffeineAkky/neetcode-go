#!/usr/bin/env bash
# 新しい問題の雛形を作る
# 使い方: ./scripts/new.sh <カテゴリ> <LeetCode番号> <slug> [Easy|Medium|Hard]
# 例:     ./scripts/new.sh arrays-hashing 217 contains-duplicate Easy
set -euo pipefail

if [ $# -lt 3 ]; then
  echo "使い方: $0 <カテゴリ> <LeetCode番号> <slug> [Easy|Medium|Hard]" >&2
  echo "カテゴリ: arrays-hashing two-pointers sliding-window stack binary-search linked-list" >&2
  echo "          trees tries heap backtracking graphs advanced-graphs 1d-dp 2d-dp" >&2
  echo "          greedy intervals math-geometry bit-manipulation" >&2
  exit 1
fi

CAT="$1"
NUM=$(printf "%04d" "$((10#$2))")
SLUG="$3"
LEVEL="${4:-}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/problems/$CAT/$NUM-$SLUG"
PKG=$(echo "$SLUG" | tr -d '-')   # Goのパッケージ名はハイフン不可
FUNC=$(echo "$SLUG" | awk -F- '{for(i=1;i<=NF;i++){ if(i==1) printf "%s",$i; else printf "%s", toupper(substr($i,1,1)) substr($i,2) }}')
TODAY=$(date +%Y-%m-%d)

if [ -d "$DIR" ]; then
  echo "すでにあります: $DIR" >&2
  exit 1
fi
mkdir -p "$DIR"

cat > "$DIR/solution.go" <<EOF
// Package $PKG: LeetCode $((10#$NUM)). $SLUG
// https://leetcode.com/problems/$SLUG/
package $PKG

func $FUNC() {
	// TODO: シグネチャを問題に合わせて書き換える
}
EOF

cat > "$DIR/solution_test.go" <<EOF
package $PKG

import "testing"

func Test$(echo "${FUNC:0:1}" | tr '[:lower:]' '[:upper:]')${FUNC:1}(t *testing.T) {
	tests := []struct {
		name string
		// TODO: 入力と期待値のフィールドを足す
	}{
		// {name: "example 1"},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			// TODO: got := $FUNC(...) と期待値を比べる
		})
	}
}
EOF

cat > "$DIR/README.md" <<EOF
# $((10#$NUM)). $SLUG${LEVEL:+ ($LEVEL)}

- 問題: https://leetcode.com/problems/$SLUG/
- NeetCode: https://neetcode.io/problems/$SLUG
- カテゴリ: $CAT

## 解法を一言で

<!-- 例: 「見たものをmapに入れて、入れる前にあるか確認」 -->

## 計算量

- 時間: O()
- 空間: O()

## 詰まった点・覚えること

-

## 記録

| 日付 | 種別 | 結果 | メモ |
|---|---|---|---|
| $TODAY | 新規 | | |
EOF

# 進捗表に1行追加
printf '| %s | [%s](problems/%s/%s-%s) | %s | %s | %s | | |\n' \
  "$((10#$NUM))" "$SLUG" "$CAT" "$NUM" "$SLUG" "$CAT" "${LEVEL:--}" "$TODAY" >> "$ROOT/PROGRESS.md"

echo "作成しました: problems/$CAT/$NUM-$SLUG"
echo "  solution.go / solution_test.go / README.md"
echo "  PROGRESS.md に1行追加"
