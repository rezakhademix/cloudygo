FROM golang:1.23-alpine

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o /webapp

EXPOSE 9000

CMD [ "/webapp" ]

# podman run -p 9000:9000 -it --name my-container my-image