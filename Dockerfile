FROM python:3.9.20-alpine3.19

# Set up a virtual environment and install dependencies in it
RUN python -m venv /app/.venv
# Install dependencies inside the virtual environment
RUN /app/.venv/bin/pip install -r ./requirements.txt

# Set environment variables
ENV PATH="/app/.venv/bin:$PATH"

# Run the uvicorn server with the correct syntax
CMD ["uvicorn", "main:app", "--reload"]
