FROM python:3.9.20-alpine3.19

RUN python -m venv .venv && source .venv/bin/activate

RUN pip install -r requirements.txt

CMD [ "uvicorn" "main:app" "--reload" ]
