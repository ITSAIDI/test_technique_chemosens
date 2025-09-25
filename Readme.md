# About

The `main.ipynb` file contains all steps from data cleaning to classification using three approaches: an embedding model, TF-IDF + SVM, and an LLM. Before classification, we performed a keyword-based preselection step.

A `manifest.md` file contains all notes and explanations, along with the results achieved for each approach.

Here are the steps to set up your environment to reproduce the results:

# Prerequisites

- [uv](https://docs.astral.sh/uv/getting-started/) installed

Install uv with `pipx`:

```bash
pipx install uv
```

For more installation options go to [uv installation](https://docs.astral.sh/uv/getting-started/installation/)

# Setup

1. Clone the repository :

```bash
git clone https://github.com/ITSAIDI/test_technique_chemosens
cd test_technique_chemosens
```

2. Run this command to install dependencies:

```bash
uv sync
```

3. Install this spacy model that you will need :

```bash
uv run python -m spacy download fr_dep_news_trf
```

- A virtual environment will be created and activated with all project dependencies installed.
- We used the free version of gemini-flash for the LLM approach, then you need first to generate a [GEMINI_API_KEY](https://ai.google.dev/gemini-api/docs/api-key)
- Add the generated key as envirement variable (`.env`).
- Now you can explore all the code in `main.ipynb`.

# Run the Docker image

- The Docker image is hosted on Docker Hub, so it must be pulled first.

```bash
docker pull itsaidi/test-technique:latest
```

- Start a container from the Docker image you pulled

```bash
docker run -d --name my-container itsaidi/test-technique:latest
```

- The container will execute all cells in `main.ipynb`, producing the results of three approaches on the test data as Excel files in the `/data` folder. To copy this folder to your local file system:

```bash
docker cp my-container:/app/data /path/on/host/data
```

- `my-container:/app/data` → path inside the container.
- `/path/on/host/data` → where you want it locally.
