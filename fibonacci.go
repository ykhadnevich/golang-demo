package main

import "github.com/gin-gonic/gin"
import "net/http"

// fibonacciHandler handles the /fibonacci route
func fibonacciHandler(c *gin.Context) {
    n := 10 // Example value; you can modify this to accept query parameters
    result := fibonacci(n)
    c.JSON(http.StatusOK, gin.H{"result": result})
}

// fibonacci calculates the nth Fibonacci number
func fibonacci(n int) int {
    if n <= 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    return fibonacci(n-1) + fibonacci(n-2)
}