# Base image
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml uv.lock requirements.txt ./
COPY pyproject.toml pyproject.toml
COPY src/ src/
COPY data/ data/
COPY models/ models/
COPY reports/ reports/

WORKDIR /
ENV UV_LINK_MODE=copy
RUN --mount=type=cache,target=/root/.cache/uv uv sync
RUN uv sync --locked --no-cache

ENTRYPOINT ["uv", "run", "src/test/evaluate.py"]