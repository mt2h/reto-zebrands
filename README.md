# reto-zebrands

## API REST

API RESR used for this project is Eve Framework developed from python

Link: https://docs.python-eve.org/en/stable/

## Note

for this project I created a VPS in my personal domain
the VPS is: retozebrands.mt2h.cl
all content for tests is inside in this VPS 

## Test from the start reto 

### Test simple API REST in python

```bash
#this test is without the database configuration 

python3 server.py
```

### Test simple API REST with Docker

```bash
#this test in Docker without the database configuration

docker build -t retozebrands .
docker run --name retozebrands-app -p 5000:5000 retozebrands
curl http://localhost:5000 | jq
```
