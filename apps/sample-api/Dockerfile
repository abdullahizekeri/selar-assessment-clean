# Base image
FROM python:3.9-slim

# Working directory inside the container
WORKDIR /app

# Copy requirements first to leverage Docker caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY src/ /app

# Expose the application port
EXPOSE 8080

# Command to run the app
CMD ["python", "app.py"]
