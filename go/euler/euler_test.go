package euler

import (
	"fmt"
	"testing"
)

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

// Reverse
func ExampleReverse() {
	fmt.Println(Reverse("Hello, world!"))
	// Output: !dlrow ,olleH
}

func BenchmarkReverse(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Reverse("Hello, world!")
	}
}
