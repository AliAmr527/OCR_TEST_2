FROM python:3-alpine

# Install required system packages
RUN apk update
RUN apk add postgresql-dev gcc python3-dev musl-dev

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

WORKDIR /app

COPY . /app

RUN chmod -R 777 /app

# Command to run your application
CMD ["python", "working.py"]
