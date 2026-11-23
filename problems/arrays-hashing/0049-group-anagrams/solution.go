// Package groupanagrams: LeetCode 49. group-anagrams
// https://leetcode.com/problems/group-anagrams/
package groupanagrams

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func groupAnagrams(strs []string) [][]string {
	seen := make(map[[26]int][]string)

	for _, str := range strs {
		cnt := [26]int{}
		for i := 0; i < len(str); i++ {
			cnt[str[i] - 'a']++
		}
		seen[cnt] = append(seen[cnt], str)
	}

	res := make([][]string, 0, len(seen))

	for _, v := range seen {
		res = append(res, v)
	}

	return res
}
