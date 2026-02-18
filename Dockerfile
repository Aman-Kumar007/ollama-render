FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y curl zstd

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Expose the port
EXPOSE 11434

# Environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_PORT=11434

# Run Ollama server bound to 0.0.0.0
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
