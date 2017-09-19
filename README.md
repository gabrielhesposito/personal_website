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

##### monitoring
Using an AWS health check to create an alarm if the instance is marked as "unhealth"
`http://gespo.me:80/pics/profile_pic.png` is the end point AWS polls on from multiple regions
