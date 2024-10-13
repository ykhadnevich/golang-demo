package main

import (
    "context"
    "errors"
    "log"
    "log/slog"
    "net/http"
    "os"
    "os/signal"
    "syscall"
    "time"

    "github.com/gin-gonic/gin"
)

func main() {
    // Set log output to stderr
    log.SetOutput(os.Stderr)

    // Create a new slog logger
    logger := slog.New(slog.NewTextHandler(os.Stdout, nil))

    // Log a startup message
    logger.Info("Starting server")

    // Create a new Gin router
    router := gin.New()

    // Define routes
    router.GET("/fibonacci", fibonacciHandler)
    router.POST("/video", videoPostHandler)
    router.GET("/videos", videosGetHandler)
    router.GET("/ping", pingHandler)
    router.GET("/memory-leak", memoryLeakHandler)

    // Graceful shutdown setup
    srv := &http.Server{
        Addr:    ":8080",
        Handler: router,
    }

    
    // Start server in a goroutine
    go func() {
        if err := srv.ListenAndServe(); err != nil && !errors.Is(err, http.ErrServerClosed) {
            logger.Error("Listen failed", "error", err)
        }
    }()

    // Wait for interrupt signal to gracefully shutdown the server
    c := make(chan os.Signal, 1)
    signal.Notify(c, os.Interrupt, syscall.SIGTERM)
    <-c

    logger.Info("Shutting down server")

    // Gracefully shutdown the server
    ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
    defer cancel()
    if err := srv.Shutdown(ctx); err != nil {
        logger.Error("Server forced to shutdown", "error", err)
    }

    logger.Info("Server exiting")
}
