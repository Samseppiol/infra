## Helpful docker commands 

#### Docker Run 
* docker run hello-world (default)
* docker run busybox echo hi there (over riding the default command with echo hi there)
* docker run busybox ls 

#### Docker Ps 
* docker ps (to list all running containers)
* docker ps --all (to list all containers that have ever run on the machine)

#### Docker Create
* docker create hello-world

#### Docker Start
* Docker start hello-world (This will just start the container but not display any output, whereas run will display output by default )
* Docker start -a hello-world (With the -a argument it will display container output)
    > To restart/rerun a stopped container, simply docker ps --all and then run docker start on a given container id

#### Docker System Prune 
* Docker system prune (Will remove all stopped containers, all networks not used by at least one container, all dangling images and all build cache)

#### Docker Logs 
* Docker logs "CONTAINER_ID" (will display all logs omitted from a previously run container, it does not re-run or restart the container, just shows log output, super  helpful for debugging)

#### Docker Stop 
* Docker stop "CONTAINER_ID", (sends a sigterm, short for terminate signal, received by the container prcoess to shut down on its own time, good for a graceful shutdown)

#### Docker Kill 
* docker kill "CONTAINER_ID" (sends a SIGKILL message to the running process in the container, informing it to stop immediately)