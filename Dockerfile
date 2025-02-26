FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Ensure Ollama is accessible globally
ENV PATH="/usr/local/bin:$PATH"

# Pull LLaMA 3 model
RUN ollama pull llama3

# Expose the Ollama API port
EXPOSE 11434

# Run Ollama on container startup
CMD ["ollama", "serve"]
