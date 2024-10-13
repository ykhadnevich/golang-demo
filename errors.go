package main

import (
    "net/http"
)

var httpErrorBadRequest = &Error{
    Code:    http.StatusBadRequest,
    Message: "Bad Request",
}

var httpErrorInternalServerError = &Error{
    Code:    http.StatusInternalServerError,
    Message: "Internal Server Error",
}

type Error struct {
    Code    int
    Message string
}







