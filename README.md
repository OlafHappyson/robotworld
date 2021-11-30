# robotworld

Database with robot world semi-automatically spinned up via terraform and docker.

**Prerequisities:**
- docker
- terraform

Steps for spinning up this infrastructure: 
1) After clonning the repo, cd to folder robotworld
2) Run following command: (scripts are prepared for scaling option 1 up to 3 replicas)
```./run.sh _NUMBER_OF_REPLICAS_NEED_```
```for example: ./run.sh 1```
- Docker will spin up 3 instances of postgres database on your local machine.
- Script will catch up ports of spinned up instances and dynamically fill configuration with neccecary sql script. Configuration of each DB instance is stored in folder sql/* .
- Terraform will init this configuration

3) Run command
```terraform apply```
- terraform will apply prepared configuration to each instance.


Support window:
- If .sh scripts are not working because of rights just run:
```chmod +x run.sh editdb.sh```
