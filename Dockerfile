FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt .

RUN  python3 -m pip install --upgrade pip

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD [ "python", "app.py" ]
