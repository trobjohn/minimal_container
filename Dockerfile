# Use Debian-based Python (better compatibility with scientific packages)
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Default command
CMD ["/bin/bash"]




# docker build -t my-ml-lab:latest . # Build and freeze
# docker run -it --rm my-ml-lab # Run and attach
#
#
# docker tag my-ml-lab:latest my-ml-lab:v1.0 # label the image
# docker save my-ml-lab:v1.0 -o my-ml-lab-v1.0.tar # output to tarball
# docker load -i my-ml-lab-v1.0.tar # load tarball 
#
# docker pull yourusername/pyspark-lab-of-doom:latest # pulll docker image
#
# -i (run) = interactive input
# -i (load) = input file
# -t = terminal (run) OR tag (build)
# --rm = clean up after yourself
# -o = output file (save)

# The S3 + wget method:
# Save the image:
# docker save my-ml-lab:v1.0 -o my-ml-lab-v1.0.tar
# Upload my-ml-lab-v1.0.tar to S3 (or any static file host).
# Give students a one-liner:
# wget https://your-s3-bucket.s3.amazonaws.com/my-ml-lab-v1.0.tar
# docker load -i my-ml-lab-v1.0.tar






# Your flow (summarized):
# Run the container (do some stuff inside):
# docker run -it my-ml-lab
# Do nonsense inside:
# Make new .csv, modify things.
# Exit the container (exit), but don't --rm, so it sticks around.
# List it:
# docker ps -a
# Commit changes (if you want to save them as a new image):
# docker commit <container_id> my-ml-lab-with-nonsense
# Tag and save:
# docker tag my-ml-lab-with-nonsense my-ml-lab-with-nonsense:v1.0
# docker save -o my-ml-lab-with-nonsense-v1.0.tar my-ml-lab-with-nonsense:v1.0
# Now you’ve got your frozen nonsense in a .tar.