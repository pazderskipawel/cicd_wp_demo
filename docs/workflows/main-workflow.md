---
layout: default
title: Main workflow
category: Workflows
palce: 1
---
# Main workflow
Configures environment, deploys and configures wordpress application, sends notification if anything fails 
<div class="mermaid">
flowchart TD
    A[Manual Trigger/push to github] --> B[Prepare evnironemnt</br> -checks if everything needed is installed </br> -installs imissing comopnents]
    A --> C[Checkout code] 
    B --> D[Clean up last build]
    C --> E[Start containers]
    D --> E
    E --> F[Configure app]
    F --> G[Validate app]
    B --> H{Nofify user <br>if step had error or was skipped}
    C --> H
    D --> H
    E --> H
    F --> H
    G --> H
    H -->|Yes| I[Send notification]
    H -->|No| J[Skip step]
</div>