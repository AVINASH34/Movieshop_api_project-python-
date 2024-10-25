FROM python:3.9.20-alpine3.19

# Install PostgreSQL dependencies
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# Copy and install requirements
COPY requirements.txt /app/requirements.txt
RUN python -m venv /app/.venv
RUN /app/.venv/bin/pip install -r /app/requirements.txt

# Set PATH to use virtual environment
ENV PATH="/app/.venv/bin:$PATH"

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
