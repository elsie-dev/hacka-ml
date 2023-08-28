# FROM python:3.11-alpine

# # Installing packages
# RUN apk update
# RUN pip install --no-cache-dir pipenv

# # Defining working directory
# WORKDIR /usr/src/app
# COPY Pipfile Pipfile.lock requirements.txt ./

# # Install API dependencies
# RUN pipenv install --deploy --ignore-pipfile
# RUN pip install --no-cache-dir -r requirements.txt

# ENTRYPOINT ["pipenv", "run", "flask", "run", "--host=0.0.0.0"]


FROM python:3.8-alpine

RUN apk update
RUN pip install --no-cache-dir pipenv

# Defining working directory and adding source code
WORKDIR /usr/src/app
COPY Pipfile Pipfile.lock bootstrap.sh ./
COPY ./ ./cashman


RUN pipenv install --system --deploy


EXPOSE 5000
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]