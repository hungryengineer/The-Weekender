# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set environment variables (optional)
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable defaults (optional)
ENV ENVIRONMENT=production \
    PORT=80

# Define the command to run your application
CMD ["python", "oop_main.py"]
