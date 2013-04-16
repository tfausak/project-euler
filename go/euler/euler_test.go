package euler

import (
	"fmt"
	"testing"
)

// Factor
func ExampleFactor() {
	fmt.Println(Factor(12))
	// Output: map[2:2 3:1]
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
