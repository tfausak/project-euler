// Package euler provides convenience functions for solving Project
// Euler problems.
package euler

import (
	"math"
)

// Divisors
func Divisors(n int) []int {
	divisors := []int{}
	for i := 1; i <= int(math.Sqrt(float64(n))); i++ {
		if n%i == 0 {
			divisors = append(divisors, i)
			if n/i != i {
				divisors = append(divisors, n/i)
			}
		}
	}
	return divisors
}

// Factor
func Factor(n int) (factors map[int]int) {
	factors = make(map[int]int)
	for divisor := 2; divisor <= n; divisor++ {
		for n%divisor == 0 {
			n /= divisor
			factors[divisor] += 1
		}
		if n <= 1 {
			break
		}
	}
	return factors
}

// IsPalindrome returns true if the string is palindromic.
func IsPalindrome(s string) bool {
	runes := []rune(s)
	length := len(runes)
	for index, rune := range runes {
		if rune != runes[length-index-1] {
			return false
		}
	}
	return true
}

// IsPrime
func IsPrime(n int) bool {
	if n <= 1 {
		return false
	}
	if n < 4 {
		return true
	}
	if n%2 == 0 {
		return false
	}
	if n < 9 {
		return true
	}
	if n%3 == 0 {
		return false
	}

	for x := 5; x <= int(math.Sqrt(float64(n))); x += 6 {
		if n%x == 0 || n%(x+2) == 0 {
			return false
		}
	}

	return true
}

// Sieve
func Sieve(limit int) []int {
	sieve_bound := (limit - 1) / 2
	cross_limit := int(math.Sqrt(float64(limit))-1) / 2
	sieve := make(map[int]bool)
	primes := []int{2}

	for i := 1; i <= cross_limit; i++ {
		if sieve[i] {
			continue
		}

		for j := 2 * i * (i + 1); j < sieve_bound; j += 2*i + 1 {
			sieve[j] = true
		}
	}

	for i := 1; i < sieve_bound; i++ {
		if sieve[i] {
			continue
		}

		primes = append(primes, 2*i+1)
	}

	return primes
}

// Triangle
func Triangle() func() int {
	n, sum := 1, 0
	return func() int {
		n, sum = n+1, sum+n
		return sum
	}
}
