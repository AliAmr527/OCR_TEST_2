FROM python:3.11-slim


RUN apt-get update && apt-get install -y \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2 \ 
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
