#!/usr/bin/env bash
# 新しい問題の雛形を作る
# 使い方: ./scripts/new.sh [--test] <カテゴリ> <LeetCode番号> <slug> [Easy|Medium|Hard]
#
#   ./scripts/new.sh arrays-hashing 217 contains-duplicate Easy
#       → solution.go と README.md を作り、PROGRESS.md に1行足す
#
#   ./scripts/new.sh --test arrays-hashing 217 contains-duplicate Easy
#       → 上に加えて solution_test.go も作る
#       （すでにある問題に付けると、テストの雛形だけを後から足す）
set -euo pipefail

WITH_TEST=false
ARGS=()
for a in "$@"; do
  case "$a" in
    --test|-t) WITH_TEST=true ;;
    *) ARGS+=("$a") ;;
  esac
done
set -- "${ARGS[@]+"${ARGS[@]}"}"

if [ $# -lt 3 ]; then
  echo "使い方: $0 [--test] <カテゴリ> <LeetCode番号> <slug> [Easy|Medium|Hard]" >&2
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
TESTNAME="Test$(echo "${FUNC:0:1}" | tr '[:lower:]' '[:upper:]')${FUNC:1}"
TODAY=$(date +%Y-%m-%d)

write_test() {
  cat > "$DIR/solution_test.go" <<EOF
package $PKG

import "testing"

func $TESTNAME(t *testing.T) {
	tests := []struct {
		name string
		// TODO: 入力と期待値のフィールドを足す（例: nums []int / want bool）
	}{
		// {name: "example 1", nums: []int{1, 2, 3, 1}, want: true},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			// got := $FUNC(tt.nums)
			// if got != tt.want {
			// 	t.Errorf("got %v, want %v", got, tt.want)
			// }
		})
	}
}
EOF
}

# すでにある問題に --test を付けた場合：テストの雛形だけ足す
if [ -d "$DIR" ]; then
  if $WITH_TEST; then
    if [ -f "$DIR/solution_test.go" ]; then
      echo "テストはすでにあります: problems/$CAT/$NUM-$SLUG/solution_test.go" >&2
      exit 1
    fi
    write_test
    echo "テストの雛形を追加しました: problems/$CAT/$NUM-$SLUG/solution_test.go"
    exit 0
  fi
  echo "すでにあります: problems/$CAT/$NUM-$SLUG（テストだけ足すなら --test を付けてください）" >&2
  exit 1
fi

mkdir -p "$DIR"

cat > "$DIR/solution.go" <<EOF
// Package $PKG: LeetCode $((10#$NUM)). $SLUG
// https://leetcode.com/problems/$SLUG/
package $PKG

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func $FUNC() {
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

$WITH_TEST && write_test

# 進捗表に1行追加
printf '| %s | [%s](problems/%s/%s-%s) | %s | %s | %s | | |\n' \
  "$((10#$NUM))" "$SLUG" "$CAT" "$NUM" "$SLUG" "$CAT" "${LEVEL:--}" "$TODAY" >> "$ROOT/PROGRESS.md"

echo "作成しました: problems/$CAT/$NUM-$SLUG"
if $WITH_TEST; then
  echo "  solution.go / solution_test.go / README.md"
else
  echo "  solution.go / README.md（テストも欲しいときは --test）"
fi
echo "  PROGRESS.md に1行追加"
