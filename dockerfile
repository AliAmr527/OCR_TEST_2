FROM python:3.11-slim

# Install required system packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

WORKDIR /app

COPY . /app

RUN chmod -R 777 /app

# Command to run your application
CMD ["python", "working.py"]
