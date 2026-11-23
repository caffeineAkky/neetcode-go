// Package containsduplicate: LeetCode 217. contains-duplicate
// https://leetcode.com/problems/contains-duplicate/
package containsduplicate

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func containsDuplicate() {
	set := make(map[int]bool, len(nums))

	for _, v := range nums {
		if set[v] {
			return true
		}
		set[v] = true
	}
	return false
}
