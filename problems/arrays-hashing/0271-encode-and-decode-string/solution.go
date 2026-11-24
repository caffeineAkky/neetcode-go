// Package encodeanddecodestring: LeetCode 271. encode-and-decode-string
// https://leetcode.com/problems/encode-and-decode-strings/
package encodeanddecodestrings

// TODO: NeetCodeでSubmitが通ったコードに置き換える
type Solution struct{}

func (s *Solution) Encode(strs []string) string {
	var sb strings.Builder
	for _, v := range strs {
		cnt := len(v)
		sb.WriteString(strconv.Itoa(cnt))
		sb.WriteString("#")
		sb.WriteString(v)
	}
	return sb.String()
}

func (s *Solution) Decode(encoded string) []string {
	var decoded []string
	i := 0
	for i < len(encoded) {
		j := i
		for encoded[j] != '#' {
			j++
		}
		length, _ := strconv.Atoi(encoded[i:j])
		start := j + 1
		end := start + length
		decoded = append(decoded, encoded[start:end])
		i = end
	}
	return decoded
}
