# Use a minimal base image
FROM python:3.9-slim-buster

# Set work directory
WORKDIR /usr/src/mycompany_api

# Copy requirements
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY mycompany_api/ ./mycompany_api/

# Expose port
EXPOSE 8080

# Create a user and switch to it
RUN groupadd -r mycompany && useradd -r -g mycompany mycompanyuser
USER mycompanyuser

# Start the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "mycompany_api.main:app"]
