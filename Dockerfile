FROM python:3.10-slim

WORKDIR /app

COPY . .

# Install uv tool
RUN pip install uv

# Install dependencies
RUN uv sync
RUN uv run python -m spacy download fr_dep_news_trf

# Install jupyter for notebook execution
RUN uv run pip install jupyter

# Run the notebook and overwrite main.ipynb with executed version
CMD ["uv", "run", "jupyter", "nbconvert", "--to", "notebook", "--execute", "--inplace", "main.ipynb"]
