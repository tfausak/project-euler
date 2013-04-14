// http://projecteuler.net/problem=7
package main

import (
	"./euler"
	"fmt"
)

func main() {
	n := 0
	count := 0
	for count < 10001 {
		n++
		if euler.IsPrime(n) {
			count++
		}
	}
	fmt.Println(n)
}
