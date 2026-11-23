// Package twosum: LeetCode 1. two-sum
// https://leetcode.com/problems/two-sum/
package twosum

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func twoSum(nums []int, target int) []int {
	seen := make(map[int]int)

	for i, v := range nums {
		if j, ok := seen[target - v]; ok {
			return []int{j, i}
		}
		seen[v] = i
	}

	return nil
}

