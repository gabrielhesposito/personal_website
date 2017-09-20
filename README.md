## Logging

##### container
Running a daemon in another container, pairing it with NGINX via a docker volume

##### log container
The two containers share a common volume

    DRIVER              VOLUME NAME
    local               log_files_yml
    local               site_logs

#### SaaS service
Using [Papertrail](https://papertrailapp.com/ "papertrailapp") to create events based on logs
For example `([^"\\]*(?:\\.[^"\\]*)*)` allows for a filter to be applied on **USER_AGENTS** (and other matching strings), a potential use is  blocking events from a monitoring service.

## Deployment

##### thoughts 
using bash for deployment is a terrible idea, however the docker CMD + bash/shell scripting is an excellent choice for examples and living documentation.`deployments/bash/`

##### monitoring
Using an AWS health check to create an alarm if the instance is marked as "unhealth"
`/pics/profile_pic.png` is the end point AWS polls on from multiple regions
