// http://projecteuler.net/problem=5
package main

import (
	"./euler"
	"fmt"
	"math"
)

func main() {
	var factors map[int]float64 = make(map[int]float64)
	for n := 1; n <= 20; n++ {
		for k, v := range euler.Factor(n) {
			factors[k] = math.Max(float64(factors[k]), float64(v))
		}
	}
	result := 1.
	for k, v := range factors {
		result *= math.Pow(float64(k), v)
	}
	fmt.Println(int(result))
}
