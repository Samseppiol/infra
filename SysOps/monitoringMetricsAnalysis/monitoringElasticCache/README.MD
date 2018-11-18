## Monitoring ElasticCashe 

Either redis or memcached 

Important Four imporant things to look at 
* CPU Utilization 
* Swap Usage 
* Evictions 
* Concurrent Connections


## CPU Utilization 
> Memcached is multilthreaded and can handle loads up to 90% cpu. If it exceeds 90%, add more nodes to the cluster.

> Redis is not multithreaded, To determine when to scale take 90 and divide by the number of cores. 


## SwapUsage 
> Swapfile is an amount of disk storage reserved if your computer runs out of ram. Generally the same size as your RAM.

#### Memcached
* Should be at 0 most of the time and should not exceed 50MB.
* If it exceeds 50MB, increase the <b>memcached_connections_overhead</b>
* <b>memcached_connections_overhead</b> defines the amount of memory to be reserved for memcached connections and other miscellaneous overhead.

#### Redis 
* No Swapusage metric, use reserved-memory

## Evictions 
> An eviction occurs when a new item is added and an old item must be removed due to lack of space in the system. 

#### Memcached
> No recommended setting. 
* Either scale up(increase memory) or scale out (add more nodes)

#### Redis 
> No recommended setting. 
* Only scale out (add read replicas)

## Concurrent Connections 
> No recommended settings for either redis or memcached.
* large traffic spike or your app is not releasing connections. Set an alarm for concurrent connections.