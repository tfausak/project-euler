// http://projecteuler.net/problem=8
package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	bytes, err := ioutil.ReadFile(os.Args[1])
	if err != nil {
		fmt.Println(err)
		return
	}

	digits := make([]int, 0)
	for _, byte := range bytes {
		byte -= 48
		if byte >= 0 && byte <= 9 {
			digits = append(digits, int(byte))
		}
	}

	max := 0
	for i := 0; i < len(digits)-5; i++ {
		product := 1
		for j := 0; j < 5; j++ {
			product *= digits[i+j]
		}

		if product > max {
			max = product
		}
	}

	fmt.Println(max)
}
