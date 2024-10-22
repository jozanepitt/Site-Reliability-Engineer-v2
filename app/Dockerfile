# Use a minimal base image
FROM python:3.9-slim

# Set work directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port
EXPOSE 80

# Run as non-root user
RUN useradd -m myuser
USER myuser

# Start the application
CMD ["python", "app.py"]

