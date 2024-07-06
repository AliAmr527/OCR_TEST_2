FROM python:3-alpine

RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Copy your application code
COPY . /app
WORKDIR /app
RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

CMD ["python", "working.py"]
