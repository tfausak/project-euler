// http://projecteuler.net/problem=4
package main

import (
	"./euler"
	"fmt"
)

func main() {
	palindrome := 0
	for x := 999; x >= 900; x-- {
		for y := x; y >= 900; y-- {
			product := x * y
			if product < palindrome {
				break
			}
			if euler.IsPalindrome(fmt.Sprintf("%v", product)) {
				palindrome = product
			}
		}
	}
	fmt.Println(palindrome)
}
