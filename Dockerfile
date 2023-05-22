# pull official base image
FROM python:3.10-alpine
# Allows docker to cache installed dependencies between builds
COPY ./ddc/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Mounts the application code to the image
COPY . code
WORKDIR /code


CMD ["python", "ddc/manage.py", "runserver", "0.0.0.0:8000"]
