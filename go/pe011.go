// http://projecteuler.net/problem=11
package main

import (
	"fmt"
	"io/ioutil"
	"math/big"
	"os"
)

func main() {
	// Read the file into an array of bytes.
	bytes, err := ioutil.ReadFile(os.Args[1])
	if err != nil {
		panic(err)
	}

	// Splits the array of bytes into a grid of integers.
	grid := [][]int{{-1}}
	row := 0
	column := 0
	for _, byte := range bytes {
		if byte == 10 {
			grid = append(grid, []int{-1})
			row += 1
			column = 0
		} else if byte == 32 {
			grid[row] = append(grid[row], -1)
			column += 1
		} else if byte >= 48 && byte <= 57 {
			digit := int(byte - 48)
			if grid[row][column] == -1 {
				grid[row][column] = digit * 10
			} else {
				grid[row][column] += digit
			}
		}
	}
	grid = grid[0 : len(grid)-1]

	// Find the greatest product.
	max := big.NewInt(0)
	size := 4
	for row := 0; row < len(grid); row++ {
		if row+size > len(grid) {
			continue
		}

		for column := size; column < len(grid[row]); column++ {
			if column+size > len(grid[row]) {
				continue
			}

			product_a := big.NewInt(1)
			product_b := big.NewInt(1)
			product_c := big.NewInt(1)
			product_d := big.NewInt(1)

			// Search right, down, down-right, and down-left.
			for offset := 0; offset < size; offset++ {
				product_a.Mul(product_a, big.NewInt(int64(grid[row][column+offset])))
				product_b.Mul(product_b, big.NewInt(int64(grid[row+offset][column])))
				product_c.Mul(product_c, big.NewInt(int64(grid[row+offset][column+offset])))
				product_d.Mul(product_d, big.NewInt(int64(grid[row+offset][column-offset])))
			}

			if product_a.Cmp(max) > 0 {
				max = product_a
			}
			if product_b.Cmp(max) > 0 {
				max = product_b
			}
			if product_c.Cmp(max) > 0 {
				max = product_c
			}
			if product_d.Cmp(max) > 0 {
				max = product_d
			}
		}
	}

	fmt.Println(max)
}
