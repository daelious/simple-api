# Sets the base image for subsequent instructions
FROM alpine:3.16.0

# Sets the working directory in the container  
WORKDIR /app

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Copies the dependency files to the working directory
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

# Copies everything to the working directory
COPY . /app

# Command to run on container start    
CMD [ "python" , "./app.py" ]