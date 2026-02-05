
FROM python:3.11-slim

WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app code
COPY app.py .

# port used by google 
ENV PORT=8080

# command to run app
CMD ["python", "app.py"] 
