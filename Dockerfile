FROM python:3.8.10-alpine

#create user for run app
RUN adduser --disabled-password --gecos '' zebrands
USER zebrands

#set workder directory to reto
WORKDIR /usr/src/app/zebrands

#copy files app to workdir
COPY requirements.txt .
COPY __init__.py .
COPY server.py .
COPY settings.py .

#install to dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

#run app
EXPOSE 5000
CMD ["python", "server.py"]
