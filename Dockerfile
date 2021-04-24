FROM golang:1.14-alpine AS builder

WORKDIR /app

COPY /app .

RUN go build *.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]