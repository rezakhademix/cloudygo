# Files and Related Code Snippets
[Repo](https://github.com/rezakhademix/postgresql-prometheus-grafana)

# Monitor PostgreSQL With Prometheus and Grafana
[If you need a complete guide please head to this medium story!](https://rezakhademix.medium.com/a-complete-guide-to-monitor-postgresql-with-prometheus-and-grafana-5611af229882)

## PromQL CheatSheet
[CheetSheet](https://promlabs.com/promql-cheat-sheet/ )

## Requirements
* Install Docker

## Not Essential 
* Install GNU Make (Not essential)

## Use the following command to run
* Run `docker compose up -d` (If you installed makefile you can use `make up`)


## You'll be able to monitor  
* CRUD operations on database
* Locks & Dead Locks
* Connections
* CPU Usage
* Load Average
* Memory Usage
* Shared Buffers
* Current Fetched Data
* Database Cache
* Parallel Workers
* Transactions
* Sessions
* and so much more...
  

## Ports
The containers and their exposed ports are:

-   **postgresql** - `:5432`
-   **prometheus** - `:9090`
-   **grafana** - `:3000`
-   **postgresql-exporter** - `:9187`
  
## PromQL
- https://promlabs.com/promql-cheat-sheet/ 


