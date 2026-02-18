FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl zstd ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/install.sh | sh

ENV OLLAMA_HOST=0.0.0.0

CMD ["sh", "-c", "ollama serve --host 0.0.0.0 --port ${PORT}"]
