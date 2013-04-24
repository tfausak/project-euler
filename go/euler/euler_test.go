package euler

import (
	"fmt"
	"math"
	"testing"
)

// Divisors
func ExampleDivisors() {
	fmt.Println(Divisors(12))
	// Output: [1 12 2 6 3 4]
}

func BenchmarkDivisors(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Divisors(12)
	}
}

// Factor
func ExampleFactor() {
	n := 1
	for k, v := range Factor(12) {
		n *= int(math.Pow(float64(k), float64(v)))
	}
	fmt.Println(n)
	// Output: 12
}

func BenchmarkFactor(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Factor(12)
	}
}

// IsPalindrome
func ExampleIsPalindrome() {
	fmt.Println(IsPalindrome("tattarrattat"))
	// Output: true
}

func BenchmarkIsPalindrome(b *testing.B) {
	for i := 0; i < b.N; i++ {
		IsPalindrome("tattarrattat")
	}
}

// IsPrime
func ExampleIsPrime() {
	fmt.Println(IsPrime(541))
	// Output: true
}

func BenchmarkIsPrime(b *testing.B) {
	for i := 0; i < b.N; i++ {
		IsPrime(541)
	}
}

// Sieve
func ExampleSieve() {
	fmt.Println(Sieve(50))
	// Output: [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47]
}

func BenchmarkSieve(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Sieve(50)
	}
}

// Triangle
func ExampleTriangle() {
	triangle := Triangle()
	triangles := make([]int, 10)
	for i := 0; i < len(triangles); i++ {
		triangles[i] = triangle()
	}
	fmt.Println(triangles)
	// Output: [1 3 6 10 15 21 28 36 45 55]
}

func BenchmarkTriangle(b *testing.B) {
	for i := 0; i < b.N; i++ {
		triangle := Triangle()
		triangles := make([]int, 10)
		for i := 0; i < len(triangles); i++ {
			triangles[i] = triangle()
		}
	}
}
