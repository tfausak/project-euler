// Package euler provides convenience functions for solving Project
// Euler problems.
package euler

// Factor
func Factor(n int) (factors map[int]int) {
	factors = make(map[int]int)
	for divisor := 2; divisor <= n; divisor++ {
		for n%divisor == 0 {
			n /= divisor
			factors[divisor] += 1
		}
		if n <= 1 {
			break
		}
	}
	return factors
}

// IsPalindrome returns true if the string is palindromic.
func IsPalindrome(s string) bool {
	return s == Reverse(s)
}

// Reverse returns the string in reverse order.
func Reverse(s string) string {
	n := len(s)
	runes := make([]rune, n)
	for _, rune := range s {
		n--
		runes[n] = rune
	}
	return string(runes)
}
