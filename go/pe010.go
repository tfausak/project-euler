// http://projecteuler.net/problem=10
package main

import (
	"./euler"
	"fmt"
	"math/big"
)

func main() {
	sum := big.NewInt(0)
	for _, prime := range euler.Sieve(2000000) {
		sum = sum.Add(sum, big.NewInt(int64(prime)))
	}
	fmt.Println(sum)
}
