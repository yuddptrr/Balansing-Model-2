FROM python:3.10

WORKDIR /app

RUN apt-get update && apt-get install -y libgl1 libglib2.0-0 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

RUN useradd -m -u 1000 user
USER user

ENV PORT 4500
EXPOSE 4500

CMD ["python", "app.py"]
