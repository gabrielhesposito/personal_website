## Logging

##### container
Running a daemon in another container, pairing it with NGINX via a docker volume

##### log container
The two containers share a common volume


    DRIVER              VOLUME NAME
    local               log_files_yml
    local               site_logs

#### SaaS service

## Deployment
##### thoughts 
using bash for deployment is a terrible idea, the however the docker CMD + bash/shell scripting is an excellent choice for examples and living documentation.`deployments/bash/`
