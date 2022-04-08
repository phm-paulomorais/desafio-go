FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY *.go ./

RUN go build hello-world.go

FROM scratch
WORKDIR /app
COPY --from=builder /app /app
ENTRYPOINT ["./hello-world"]