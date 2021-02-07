## Logging

##### container
Running a daemon in another container, pairing it with NGINX via a docker volume
using `submodule/remote_syslog2`
##### log container
c_server = daemon/service/pool writing to file(s)/pipe(s)
    
    docker run --name c_server -v site_logs:/var/log:rw -p 80:80 -d c_server_image:latest

c_driver = `submodule\remote_syslog2\examples\docker`

    docker run --name c_driver -v log_files_yml:/etc/log_files.yml:rw -v site_logs:ro -d c_driver_image:latest

The two containers share a common volume **docker volume ls**

    DRIVER              VOLUME NAME
    local               log_files_yml
    local               site_logs

#### SaaS services
Using [Papertrail](https://papertrailapp.com/ "papertrailapp") see ( <https://papertrailapp.com/> ) to create events based on logs
For example `([^"\\]*(?:\\.[^"\\]*)*)` allows for a filter to be applied on **USER_AGENTS** (and other matching strings), a potential use is  blocking events from a monitoring service.

## Build/CI

#### CircleCI + github 
these free options seems like a great option for OS or personal projects. Nice gui + notifications + cloud hosting and it fits the IaC paradigm resulting in tons of reuse.
`.circleci/config.yml`

CircleCI relies heavily on containers. Containers within containers.
you select a docker image and your workload runs on it, so prebaking your dependencies is totally doable
saving you time on every call to package managers. Plus you can run jobs in parallel and switch images.

```
 ## define your image like
docker:
  - image: cibuilds/hugo:latest
```

CircleCI  gives you the ability to `ssh` into these images if you hand over $$. 
Otherwise you'll need to run the images locally and monkey around to diagnose build errors.
```
#run the container as root, and use a cmd that wont exit
docker run -d -u 0  --name foo --entrypoint '/bin/sh' cibuilds/hugo:latest -c 'tail -f /dev/null'
```

## Deployment

##### Bash 
using bash for deployment is a terrible idea, however the docker CMD + bash/shell scripting is an excellent choice for examples and living documentation.`deployments/bash/`
examples: 

build local push remote

```sh
./build_image.sh testbuild && ./run_image.sh test:build && ./send_image.sh test:build prod.personal.aws
```
run on remote

```sh
docker tag testbuild:test testbuild:bak && docker stop mysite && docker rm mysite && docker run --name mysite -v site_logs:/var/log:rw -p 80:80 -d testbuild:test
]
```

##### Ansible

Ansible is more flexible option. Easy to read/diagnose.

using `deployment/ansible/` for host docker provisionment
```sh
$ ansible-playbook mysite.yml
```

##### monitoring
Using an AWS health check to create an alarm if the instance is marked as "unhealth"
`/pics/profile_pic.png` is the end point AWS polls on from multiple regions

