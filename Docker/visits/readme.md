## Docker Compose 
> uses a yml file to accept commands/arguments for inter-container connections. Abstracts away having to use complex docker cli commands. 

> For our example using a node and redis app it would follow something like this: 

### the containers I want created: 
##### redis-server 
 * Make it using the redis image 
##### node-app 
 * Make it using the current Dockerfile in the current directory
 * Map port 8081 to 8081 


 ### Commands 
 * docker run myimage > docker-compose up
 * docker build . && docker run myimage > docker-compose up --build
 * docker-compose up -d > Runs docker compose in the background 
 * docker-compose down > Stops any running containers in the background
 * docker-compose ps > Lists all containers running with docker-compose. Must be run in the directory containing the docker-compose.yml