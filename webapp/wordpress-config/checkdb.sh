#!/bin/bash
# Wait for DB to be ready
until echo > /dev/tcp/db/3306; do
  echo "Waiting for database connection..."
  sleep 3
done
echo "Database is ready"