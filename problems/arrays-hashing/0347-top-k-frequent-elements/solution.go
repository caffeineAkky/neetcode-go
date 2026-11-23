// Package topkfrequentelements: LeetCode 347. top-k-frequent-elements
// https://leetcode.com/problems/top-k-frequent-elements/
package topkfrequentelements

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func topKFrequent(nums []int, k int) []int {
	seen := make(map[int]int)
	
	for _, v := range nums {
		seen[v]++
	}

	bucket := make([][]int, len(nums) + 1)
	for num, cnt := range seen {
		bucket[cnt] = append(bucket[cnt], num)
	}

	res := make([]int, 0, k)
	for i := len(bucket) - 1; i >= 1; i-- {
		for _, v := range bucket[i] {
			res = append(res, v)
			if len(res) == k {
				return res
			}
		}
	}
	return res
}
