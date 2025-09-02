---
layout: default
title: Backups workflows
category: Workflows
palce: 2
---
# Save Wordpress state (Back up current Wordress state)
Workflow saves wordpress state by creating backup of `/var/www/html` and `wordpress` database
<div class="mermaid">
flowchart TD
    A[Manual trigger] --> C[Create backup directory]
    B[Automatic trigger when container stopps] --> C
    C --> D[Copy WP files from container</br>Copies files from /var/www/html directory]
    D --> E[Create DB dump from container</br>Created wordpress database dump from db container]
    E --> F[Upload backup as artifact]
    F --> G[Delete backup directory]
    G --> H[Delete oldest artifacts]
    H --> I[Backup Complete]
</div>

# Restore Wordpress backup workflow
This workflow is restoring latest/custom wordpress backup
<div class="mermaid">
flowchart TD
    A[Manual trigger with run_id] --> D[Download artifact from run]
    B[Automatic trigger by main pipeline] --> C[Find last successful run_id]
    C --> D
    D --> E[Upload restored backup to containers]
    E --> F{Success?}
    F -->|Yes| G[Restore Complete]
    F -->|No| H[Install plain WordPress]
</div>