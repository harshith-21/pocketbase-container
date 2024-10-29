#!/bin/sh

# Start PocketBase in the background
./pocketbase serve --http=0.0.0.0:8090 &

# Wait for PocketBase to fully start before proceeding
sleep 5  # Adjust this value depending on how long PocketBase takes to initialize

# Create the default admin user
echo "Creating default admin user..."
./pocketbase admin create  admin@admin.com adminadmin

# Bring PocketBase process to the foreground
wait