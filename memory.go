package main

import "github.com/gin-gonic/gin"
import "net/http"
func memoryLeakHandler(c *gin.Context) {

    c.JSON(http.StatusOK, gin.H{"message": "Memory leak handler hit!"})
}
n
func memoryLeak(arg1 int, arg2 int) {
  
}