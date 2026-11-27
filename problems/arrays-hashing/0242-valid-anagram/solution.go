// Package validanagram: LeetCode 242. valid-anagram
// https://leetcode.com/problems/valid-anagram/
package validanagram

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func isAnagram(s string, t string) bool {
	if len(s) != len(t) {
		return false
	}

	cnt := [26]int{}

	for i := 0; i < len(s); i++ {
		cnt[s[i] - 'a']++
		cnt[t[i] - 'a']--
	}

	return cnt == [26]int{}
}
