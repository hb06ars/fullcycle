FROM golang:1.21-alpine as builder

WORKDIR /app

COPY go.mod .   

RUN go mod tidy

COPY . .

RUN go build -o fullcycle .

FROM alpine:latest

COPY --from=builder /app/fullcycle /fullcycle

CMD ["/fullcycle"]
