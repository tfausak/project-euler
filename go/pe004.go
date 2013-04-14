// http://projecteuler.net/problem=4
package main

import "fmt"

func isPalindrome(s string) bool {
	return s == reverse(s)
}

func reverse(s string) string {
	n := len(s)
	runes := make([]rune, n)
	for _, rune := range s {
		n--
		runes[n] = rune
	}
	return string(runes)
}

func main() {
	palindrome := 0
	for x := 999; x >= 900; x-- {
		for y := x; y >= 900; y-- {
			product := x * y
			if product < palindrome {
				break
			}
			if isPalindrome(fmt.Sprintf("%v", product)) {
				palindrome = product
			}
		}
	}
	fmt.Println(palindrome)
}
