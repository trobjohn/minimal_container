
# Build container image
docker build -t mllab:latest .

# Run image
docker run -d --name mllab \
    -v "$PWD":/workspace \
    -w /workspace \
    mllab:latest \
    sleep infinity
