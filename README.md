# reto-zebrands

## API REST

API RESR used for this project is Eve Framework developed from python

Link: https://docs.python-eve.org/en/stable/

## TESTS FROM THE START RETO 

### test simple API REST in python

```bash
#this test is without the database configuration 

python3 server.py
```

### test simple API REST with Docker

```bash
#this test is without the database configuration 
#this test is without the database configuration

docker build -t retozebrands . 
docker run -p 5000:5000 retozebrands
```