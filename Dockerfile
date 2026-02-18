FROM ubuntu:22.04

# Install required dependencies
RUN apt-get update && \
    apt-get install -y curl zstd ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Pull small model during build
RUN ollama serve & sleep 10 && ollama pull phi

# Start Ollama on Render dynamic port
CMD ["sh", "-c", "OLLAMA_HOST=0.0.0.0:$PORT ollama serve"]
