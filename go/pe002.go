// http://projecteuler.net/problem=2
package main

import "fmt"

func main() {
	sum := 0
	for x, y := 0, 1; x < 4e6; x, y = y, x+y {
		if x%2 == 0 {
			sum += x
		}
	}
	fmt.Println(sum)
}
