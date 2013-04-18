// http://projecteuler.net/problem=12
package main

import (
	"./euler"
	"fmt"
)

func main() {
	generator := euler.Triangle()
	triangle := 0

	for len(euler.Divisors(triangle)) <= 500 {
		triangle = generator()
	}

	fmt.Println(triangle)
}
