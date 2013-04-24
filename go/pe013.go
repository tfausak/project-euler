// http://projecteuler.net/problem=13
package main

import (
	"fmt"
	"io"
	"math/big"
	"os"
)

func main() {
	sum := big.NewInt(0)

	file, err := os.Open(os.Args[1])
	if err != nil {
		panic(err)
	}
	defer func() {
		err := file.Close()
		if err != nil {
			panic(err)
		}
	}()

	bytes := make([]byte, 51)
	for {
		n, err := file.Read(bytes)
		if err != nil && err != io.EOF {
			panic(err)
		}
		if n == 0 {
			break
		}

		number := new(big.Int)
		_, err = fmt.Sscan(string(bytes[:len(bytes)-1]), number)
		if err != nil {
			panic(err)
		}

		sum = sum.Add(sum, number)
	}

	fmt.Println(sum.String()[:10])
}
