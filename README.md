# robotworld

Database with robot world automatically spinned up via terraform and docker

**Prerequisities:**
- docker
- terraform

Steps for spinning up this infrastructure: 
1) After clonning the repo, cd to folder robotworld
2) Run following command
```docker-compose up --scale postgres=3```
- Docker will spin up 3 instances of postgres database on your local machine.

3) Its neccecary to open new window in terminal to run following script
4) Run following command
```./editdb.sh 3```
- Script will catch up ports of spinned up instances and dynamically fill configuration with neccecary sql script. Configuration of each DB instance is stored in folder sql/* .
5) Run command
```terraform apply```
- terraform will apply prepared configuration to each instance.
