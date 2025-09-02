---
layout: default
title: Backups workflows
category: Workflows
palce: 2
---
# Save Wordpress state (Back up current Wordress state)
- can be called manually, or automatically when container stops
## Summary
  1. Create directory for backup
  2. Copy WP files from container
  3. Create db dump from container
  1. Upload backup as `artifact`
  2. Delete backup directory
  3. Delete oldest artifacts 

```mermaid
flowchart TD
    A[Start Backup] --> B[Create backup directory]
    B --> C[Copy WP files from container]
    C --> D[Create DB dump from container]
    D --> E[Upload backup as artifact]
    E --> F[Delete backup directory]
    F --> G[Delete oldest artifacts]
    G --> H[Backup Complete]

``` 
# Restore Wordpress backup workflow
- part of main workflow, restores wordpress from last successfully saved wordpress, can be run manually with specified run_id to restore specific backup  
## Summary
  1. Find last successfull run_id
  2. Download artifact from that run
  3. Upload restored backup to containers
  4. If any pf this steps fails, plain version of WordPress will be installed

```mermaid
flowchart TD
    A[Start Restore] --> B[Find last successful run_id]
    B --> C[Download artifact from run]
    C --> D[Upload restored backup to containers]
    D --> E{Success?}
    E -->|Yes| F[Restore Complete]
    E -->|No| G[Install plain WordPress]
yaml
```