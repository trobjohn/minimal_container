
# Build container image
docker build -t my-ml-lab:latest .

# Run image
docker run -d --name my-ml-lab \
    -v "$PWD":/workspace \
    -w /workspace \
    my-ml-lab:latest \
    sleep infinity

