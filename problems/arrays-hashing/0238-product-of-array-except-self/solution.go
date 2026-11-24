// Package productofarraexceptself: LeetCode 238. product-of-arra-except-self
// https://leetcode.com/problems/product-of-array-except-self/
package productofarraexceptself

// TODO: NeetCodeでSubmitが通ったコードに置き換える
func productExceptSelf(nums []int) []int {
    n := len(nums)
    left := make([]int, n)
    right := make([]int, n)
    answer := make([]int, n)

    // 左の積：左から右へ
    left[0] = 1
    for i := 1; i < n; i++ {
        left[i] = left[i - 1] * nums[i - 1]
    }

    // 右の積：右から左へ
    right[n-1] = 1
    for i := n - 2; i >= 0; i-- {
        right[i] = right[i + 1] * nums[i + 1]
    }

    // 掛け合わせる
    for i := 0; i < n; i++ {
        answer[i] = left[i] * right[i]
    }
    return answer
}


