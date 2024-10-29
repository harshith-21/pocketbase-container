# Pocketbase Containerization

Docker file above to multi-arch dockerize pocketbase 

```sh
# Create a new builder instance
docker buildx create --name multiarch --driver docker-container --use

# Verify it's ready
docker buildx inspect --bootstrap

# build docker image
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 \
  -t yourusername/pocketbase:0.22.22 \
  -t yourusername/pocketbase:latest \
  --push .
```

#### Arch's
- linux/amd64: Intel/AMD computers, cloud VMs, Intel Macs
- linux/arm64: Apple Silicon Macs, AWS Graviton, Raspberry Pi 4/5, newer ARM servers
- linux/arm/v7: Raspberry Pi 2/3, older ARM devices

## NOTE
Tried so much, didnt work. using default linux/amd64 for arch

> docker build -t harshith21/pocketbase:v0.22.22 -t harshith21/pocketbase:latest --push .

default useremail and password
```sh
user-email :admin@admin.com 
password: adminadmin
```