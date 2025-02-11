FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags="-s -w" -o myapp



FROM scratch
WORKDIR /var/www
COPY --from=builder /app .
ENTRYPOINT ["./myapp"]
CMD [ "oi" ]
