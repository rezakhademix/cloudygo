FROM golang:1.23-apline

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o /webapp

EXPOSE 9000

CMD [ "./webapp" ]
