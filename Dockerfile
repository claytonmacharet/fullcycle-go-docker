# Compila o binário
FROM golang:alpine AS builder

WORKDIR /app
COPY main.go .

RUN go mod init app && \
    go build -ldflags="-s -w" -o main

# Cria a imagem final
FROM scratch

COPY --from=builder /app/main /

CMD ["/main"]