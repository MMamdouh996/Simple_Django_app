# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Set the environment variable for Django settings module
ENV DJANGO_SETTINGS_MODULE=myproject.settings

# Copy the index.html file to the static files directory
COPY index.html /app/static/

# Collect static files into the static files directory
RUN python manage.py collectstatic --noinput

# Expose port 8000 for the Django app
EXPOSE 8000

# Start the Django app
CMD ["python", "gpproject/manage.py", "runserver", "0.0.0.0:8000"]

