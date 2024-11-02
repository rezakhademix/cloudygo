FROM golang:1.23-alpine AS builder

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN env GOOS=linux CGO_ENABLED=0 go build -o webapp .

FROM alpine:3.20

COPY --from=builder /app/webapp .

EXPOSE 9000

CMD ["./webapp"]