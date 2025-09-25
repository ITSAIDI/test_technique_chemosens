# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements 
COPY requirements.txt .

# Install pip packages
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir jupyter uvicorn notebook

# Copy the local code into the container
COPY . .

# Default command: run the notebook and print a message
CMD echo "Starting main.ipynb execution..." \
    && jupyter nbconvert --to notebook --execute main.ipynb --output executed_main.ipynb \
    && echo "Notebook execution completed!"
