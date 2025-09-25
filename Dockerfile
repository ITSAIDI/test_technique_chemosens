FROM python:3.10-slim

WORKDIR /app

COPY . .

# Install uv tool
RUN pipx install uv

# Install dependencies
RUN uv sync

# Run the main.ipynb and produce the results on /data folder