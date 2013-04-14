// http://projecteuler.net/problem=6
package main

import "fmt"

func main() {
	sum_of_squares := 0
	square_of_sums := 0
	for n := 1; n <= 100; n++ {
		sum_of_squares += n * n
		square_of_sums += n
	}
	square_of_sums *= square_of_sums
	fmt.Println(square_of_sums - sum_of_squares)
}
