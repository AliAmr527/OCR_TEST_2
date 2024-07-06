FROM python:3.11-slim

RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Copy your application code
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

CMD ["python", "working.py"]