FROM python:3.12-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Django port
EXPOSE 8000

# Run with Gunicorn (better for production than runserver)
CMD ["gunicorn", "django_todo.wsgi:application", "--bind", "0.0.0.0:8000"]

