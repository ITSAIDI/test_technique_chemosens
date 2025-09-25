# About

The `main.ipynb` file contains all steps from data cleaning to classification using three approaches: an embedding model, TF-IDF + SVM, and an LLM. Before classification, we performed a keyword-based preselection step.

A `manifest.md` file contains all notes and explanations, along with the results achieved for each approach.

Here are the steps to set up your environment to reproduce the results:

# Prerequisites

- [uv](https://docs.astral.sh/uv/getting-started/) installed

Install uv with `pip`:

```bash
pip install uv
```

For more installation options go to [uv installation](https://docs.astral.sh/uv/getting-started/installation/)

# Setup

1. Clone the repository :

```bash
git clone https://github.com/ITSAIDI/test_technique_chemosens
cd test_technique_chemosens
```

2. Install dependencies:

```bash
uv sync
```

- A virtual environment will be created and activated with all project dependencies installed.
- We used the free version of gemini-flash for the LLM approach, then you need first to generate a [GEMINI_API_KEY](https://ai.google.dev/gemini-api/docs/api-key)
- Add the generated key as envirement variable (`.env`).
