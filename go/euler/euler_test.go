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
