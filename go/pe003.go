// http://projecteuler.net/problem=3
package main

import "fmt"

func main() {
	var number int64 = 600851475143
	var factor int64 = 1
	for number != 1 {
		factor++
		for number%factor == 0 {
			number /= factor
		}
	}
	fmt.Println(factor)
}
