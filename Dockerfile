# Sets the base image for subsequent instructions
FROM python:alpine3.16

RUN adduser -D simple-api
USER simple-api
WORKDIR /home/simple-api

# Copies the dependency files to the working directory
COPY --chown=simple-api:simple-api requirements.txt requirements.txt

# Install dependencies
RUN pip install --user -r requirements.txt
ENV PATH="/home/simple-api/.local/bin:${PATH}"

# Copies everything to the working directory
COPY --chown=simple-api:simple-api . .

# Command to run on container start    
CMD [ "python" , "./app.py" ]