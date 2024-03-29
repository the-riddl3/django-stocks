FROM python:3.9

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Install Confluent CLI
RUN curl -sL https://cnfl.io/cli | sh -s -- -b /usr/local/bin

COPY . .

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "djangostocks.wsgi:application"]
