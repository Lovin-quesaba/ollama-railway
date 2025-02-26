FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Download LLaMA 3.1
RUN ollama pull llama3

# Expose the Ollama API port
EXPOSE 11434

# Start Ollama API
CMD ["ollama", "serve"]
