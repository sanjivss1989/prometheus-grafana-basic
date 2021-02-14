# Application Monitoring using Spring Boot, Prometheus DB and Grafana dashboards.
## Prometheus: 
Prometheus is a time-series database that listens to the HTTP port on which the application is running. The metrics provided by spring actuator is pulled by a library called Micrometer and pushing the data to prometheus. 



## Grafana:
Grafana provides us an opportunity to create pictorial graphs through which we can view the necessary metrics like CPU, Memory, Latency and Requests/Second.
Grafana uses prometheus as a datasource and renders the details in a user friendly manner through dashboards.


## Steps: 

Step 1: 
Go to workspace and navigate to project root folder.
In this case the root folder = prometheus-grafana-basi.

Step 2:
Build docker image : 
 -- Command = docker build -t prometheus-grafana-basic .
 
Step 3:
Run the application docker image:
 -- command = docker run -it -p 8081:8081 prometheus-grafana-basic
 
Step 4:
Verify the application is UP by hitting : http://localhost:8081/health

Step 5:
Verify the actuator endpoint exposing the metrics information by hitting:
http://localhost:8081/actuator/metrics

Step 6:
Pull prometheus docker image from docker hub:
 -- command = docker pull prom/prometheus
 
Step 6:
In prometheus/yml file, configure the target to listen to the application port
The target format is <localhost IP address>:<port_no>
To search the IP address , command prompt and find the IPV4 address.
For example 192.168.0.10:8081

Step 7:
Run prometheus database using below command:
   docker run -p 9090:9090 -v C:\Softwares\prometheus-2.24.1.windows-amd64\prometheus-2.24.1.windows-amd64\prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
   
Step 8:
Verify Prometheus DB is up : http://localhost:9090.

Step 9: Go to localhost:9090/targets and check the endpoint
The endpoint http://192.168.0.10:8081/actuator/prometheus will show up.

Step 10:
Run grafana application in local by running below command:
docker run -d -p 3000:3000 grafana/grafana

Step 10:
Verify the grafana in localhost : http://localhost:3000

Step 11:
Configure Prometheus data source in grafana.
On the left hand side menu - > Settings -> Data Source -> Add data source
In the URL give http:<localhost_IP address>:9090 and save-test connection.

Step 12: Create custom dashboard as per the requirement.
