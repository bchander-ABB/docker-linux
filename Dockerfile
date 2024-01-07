FROM python:3.11
#RUN apt-get update ; \
#    apt-get install -y libreoffice-writer ;\
#    Remove-Item -Force -Recurse -Path /var/lib/apt/lists/*

#FROM python:3.11-slim-buster

# Install required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libreoffice-writer && \
    rm -rf /var/lib/apt/lists/*


# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN python -m pip install --trusted-host pypi.org --no-cache-dir -r requirements.txt

# Make port 8501 available to the world outside this co	ntainer
EXPOSE 8000

ENV PATH="/usr/local/bin:$PATH"

# Run streamlit when the container launches
CMD ["python", "-m", "streamlit", "run", "RFQ-commercial-libraoffice.py", "--server.port", "8000", "--server.address", "0.0.0.0"]
#CMD ["streamlit", "run", "RFQ-commercial-libraoffice.py", "--server.port", "8000", "--server.address", "0.0.0.0"]

