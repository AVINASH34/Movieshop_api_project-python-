FROM python:3.9.20-alpine3.19

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt

# Set up a virtual environment
RUN python -m venv /app/.venv

# Install dependencies
RUN /app/.venv/bin/pip install -r /app/requirements.txt

# Set environment variables
ENV PATH="/app/.venv/bin:$PATH"

# Run the uvicorn server with the correct syntax
CMD ["uvicorn", "main:app", "--reload"]
