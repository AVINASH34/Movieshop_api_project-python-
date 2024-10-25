FROM python:3.9.20-alpine3.19

# Install PostgreSQL dependencies
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# Copy app files and install dependencies
COPY requirements.txt /app/requirements.txt
COPY main.py /app/main.py
WORKDIR /app
RUN python -m venv /app/.venv
RUN /app/.venv/bin/pip install -r /app/requirements.txt

# Set PATH to use virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
