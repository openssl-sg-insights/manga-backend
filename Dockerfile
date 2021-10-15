FROM python:3.9-bullseye

WORKDIR app
RUN pip install poetry

COPY ./pyproject.toml ./poetry.lock ./
RUN poetry install --no-dev

EXPOSE 8000
ENTRYPOINT uvicorn app:create_app --factory --host 0.0.0.0 --port 8000
