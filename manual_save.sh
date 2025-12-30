
# Tarball the image

docker tag mllab:latest mllab:save
docker save mllab:save | gzip > mllab.tar.gz