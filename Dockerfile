# Use official Python image as base
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Install dependencies
RUN pip install django

# Expose port
EXPOSE 8000

# Run Django server
CMD ["python", "manage.py", "runserver"]
