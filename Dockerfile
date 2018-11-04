# Get base image
FROM python:3.6-alpine

# Copy python requirements
COPY requirements.txt /

# Install dependencies for building bluepy/bluez
RUN apk add build-base \
    gcc \
    glib-dev \
    linux-headers

# Install python dependencies from pip
RUN pip install -r /requirements.txt

COPY . /app

WORKDIR /app

CMD ["python3", "ble-mqtt-bridge.py"]