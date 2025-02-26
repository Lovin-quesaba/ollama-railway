FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Expose the Ollama API port
EXPOSE 11434

# Start Ollama & pull LLaMA 3 on container start
ENTRYPOINT ollama serve & sleep 5 && ollama pull llama3 && tail -f /dev/null
