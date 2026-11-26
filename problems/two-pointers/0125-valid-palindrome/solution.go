// Package validpalindrome: LeetCode 125. valid-palindrome
// https://leetcode.com/problems/valid-palindrome/
package validpalindrome

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func isPalindrome(s string) bool {
	var sb strings.Builder

	for _, r := range s {
		if unicode.IsLetter(r) || unicode.IsDigit(r) {
			sb.WriteRune(unicode.ToLower(r))
		}
	}
	cleaned := sb.String()

	length := len(cleaned)
	for i := 0; i < length / 2; i++ {
		if cleaned[i] != cleaned[length-1-i] {
			return false
		}
	}
	return true
}

func isPalindrome(s string) bool {
	left, right := 0, len(s)-1

	for left < right {
		// 左が英数字じゃなければ、左だけ進める
		if !isAlnum(s[left]) {
			left++
			continue
		}
		// 右が英数字じゃなければ、右だけ戻す
		if !isAlnum(s[right]) {
			right--
			continue
		}
		// 両方英数字なら、小文字にそろえて比べる
		if toLower(s[left]) != toLower(s[right]) {
			return false
		}
		left++
		right--
	}
	return true
}

func isAlnum(c byte) bool {
	return ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9')
}

func toLower(c byte) byte {
	if 'A' <= c && c <= 'Z' {
		return c + ('a' - 'A') // 大文字を小文字にずらす
	}
	return c
}
