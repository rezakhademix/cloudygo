package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

const PORT = "9000"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello, World!")
	})

	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "app is healthy!")
	})

	log.Println("server has started")

	if err := http.ListenAndServe(":"+PORT, nil); err != nil {
		log.Printf("err happened during serving app, err: %v", err)
		os.Exit(1)
	}
}
