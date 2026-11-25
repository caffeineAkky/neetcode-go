// Package longestconsecutivesequence: LeetCode 128. longest-consecutive-sequence
// https://leetcode.com/problems/longest-consecutive-sequence/
package longestconsecutivesequence

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func longestConsecutive(nums []int) int {
	set := make(map[int]bool) // [6,3,2,1,4,5,0]

	for _, v := range nums {
		set[v] = true
	}

	res := 0

	for k := range set {
		if set[k-1] {
			continue
		}
		cnt := 1
		for set[k+cnt] {
			cnt++
		}
		res = max(cnt, res)
	}
	return res
}
