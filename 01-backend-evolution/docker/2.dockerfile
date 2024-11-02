# syntax=docker/dockerfile:1

ARG GO_VERSION=1.23
FROM --platform=$BUILDPLATFORM golang:${GO_VERSION}-alpine AS builder
WORKDIR /app

ENV GOCACHE=/root/.cache/go-build

COPY go.mod go.sum ./

RUN --mount=type=cache,target=/go/pkg/mod/ \
    go mod download

COPY . .  
ARG TARGETARCH
ARG GOOS=linux
RUN CGO_ENABLED=0 GOARCH=$TARGETARCH GOOS=$GOOS go build -o webapp ./cmd/httpserver/main.go

FROM alpine:latest AS final
WORKDIR /

RUN apk --update add ca-certificates tzdata && update-ca-certificates

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser
USER appuser

COPY --from=builder /app/webapp .

EXPOSE 9000

CMD ["./webapp"]
