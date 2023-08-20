# Use the official Python image as the base
FROM python:3.8-alpine

# Installing packages
RUN apk update && apk add --no-cache bash
RUN pip install --no-cache-dir pipenv

# Defining working directory and adding source code
WORKDIR /usr/src/app
COPY Pipfile Pipfile.lock requirements.txt bootstrap.sh ./
COPY cashman ./cashman

# Install API dependencies using pipenv and requirements.txt
RUN pipenv install --deploy --ignore-pipfile
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your Flask app will run on
EXPOSE 5000

# Set the entrypoint to run the bootstrap.sh script
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]
