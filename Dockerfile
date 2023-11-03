# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /code

# Copy the local requirements.txt into the container at /code
COPY requirements.txt /code/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the local code directory into the container at /code
COPY . /code

# Make port 8002 available to the world outside this container
EXPOSE 8002

# Command to run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8002"]
