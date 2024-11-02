package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello, World!")
	})

	log.Println("server has started")

	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		log.Printf("err happened during serving app, err: %v", err)
		os.Exit(1)
	}
}
