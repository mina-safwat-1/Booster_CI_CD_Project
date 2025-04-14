# Use Python 3.6 as base image
FROM python:3.6-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the project files
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Run migrations and start server
CMD ["sh", "-c", "python3.6 manage.py makemigrations && python3.6 manage.py migrate && python3.6 manage.py runserver 0.0.0.0:8000"]

