# specify our base image
FROM alpine:3.5

# commands for copying the files and installing the #dependencies.
# Install python and pip
RUN apk add --update py2-pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy the files you have created earlier into our image 
# for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# tell the port number the container should expose
EXPOSE 5000

# the command for running the application
CMD ["python", "/usr/src/app/app.py"]