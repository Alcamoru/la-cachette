FROM python:3.12.2-alpine3.19
LABEL authors="alcam"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./lacachette /lacachette
COPY ./scripts /scripts

WORKDIR /lacachette

EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base musl-dev linux-headers && \
    /py/bin/pip install -r /requirements.txt && \
    apk del .tmp-deps && \
    adduser --disabled-password --no-create-home app && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media


RUN chown -R app:app ../vol && \
    chown -R app:app ../lacachette && \
    chmod -R 755 ../vol && \
    chmod -R +x ../scripts


ENV PATH="/scripts:/py/bin:${PATH}"

USER app

CMD ["run.sh"]
