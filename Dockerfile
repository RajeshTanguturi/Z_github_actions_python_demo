# Build stage
FROM python:3.12-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Final stage 
FROM python:3.12-alpine
WORKDIR /app
COPY --from=builder /usr/local /usr/local
COPY app/ app/
CMD ["python", "app/app.py"]