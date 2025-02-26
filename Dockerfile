FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Start Ollama in the background & pull the model
RUN /root/.ollama/bin/ollama serve & sleep 5 && /root/.ollama/bin/ollama pull llama3

# Expose the Ollama API port
EXPOSE 11434

# Run Ollama on container startup
CMD ["/root/.ollama/bin/ollama", "serve"]
