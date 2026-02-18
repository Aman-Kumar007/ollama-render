FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Pull a small model during build (IMPORTANT)
RUN ollama serve & sleep 8 && ollama pull phi

# Start Ollama on Render's port
CMD ["sh", "-c", "OLLAMA_HOST=0.0.0.0:$PORT ollama serve"]
