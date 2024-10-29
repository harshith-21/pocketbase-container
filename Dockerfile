# Step 1: Use Alpine as base image
FROM alpine:3.18

# Step 2: Set the version and download URL of PocketBase
ENV POCKETBASE_VERSION=0.22.22
ENV POCKETBASE_URL=https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_linux_amd64.zip

# Step 3: Install necessary dependencies (curl for downloading and unzip for extracting)
RUN apk --no-cache add curl unzip sqlite

# Step 4: Create a directory for PocketBase and download the binary
RUN mkdir /pocketbase \
    && cd /pocketbase \
    && curl -L ${POCKETBASE_URL} -o pocketbase.zip \
    && unzip pocketbase.zip \
    && rm pocketbase.zip

# Step 5: Expose the PocketBase default port
EXPOSE 8090

# Step 6: Set the default working directory
WORKDIR /pocketbase

# Step 7: Copy entrypoint script to initialize admin user
COPY entrypoint.sh /pocketbase/entrypoint.sh
RUN chmod +x /pocketbase/entrypoint.sh

# Step 8: Set the default command to run the entrypoint script
CMD ["/pocketbase/entrypoint.sh"]