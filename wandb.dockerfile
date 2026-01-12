FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Install wandb into the image environment
RUN uv pip install --system wandb

WORKDIR /app
COPY wandb_tester.py .

ENTRYPOINT ["python", "wandb_tester.py"]
