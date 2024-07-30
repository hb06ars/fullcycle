FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o fullcycle main.go

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]

