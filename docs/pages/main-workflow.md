# Main workflow
## Summary
  1. Clean up last environment
      1. Clean up current docker containers and volumes related to project
  2. Prepare environment
      1. Check out code
      2. Check out current environment 
      3. Install docker and docker compose if its not installed 
  3. Run app 
      1. Start containers and mount eeded configurations
  4. Configure app
      1. Configures nginx reverse proxy 
      2. Configures wordpress (installs `WP-CLI`, finishes installation of WP )
  5. Validate app
      1. Check if containers are working
      2. Check if SSL certificates are valid
      2. Check if website is available
      4. Check if website is running
  6. Send notifications when build failed or was skipped