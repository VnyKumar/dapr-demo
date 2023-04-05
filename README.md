# dapr-demo

# This repo is created for setting up dapr in local how application will connect to dapr



## Prerequisites
1) Install docker if not installed already

2) Install and initialize dapr cli by following steps mentioned here

    - Dapr Install `wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash`

	    Ref: https://docs.dapr.io/getting-started/install-dapr-cli/

    - Dapr Init `dapr init`

	    Ref: https://docs.dapr.io/getting-started/install-dapr-selfhost/

3) Verify Dapr Installation and Initialization

	`docker ps`
    
    it should give list 3 docker container 
    - openzipkin/zipkin
    - daprio/dapr:1.10.4
    - redis:6

	Dapr uses redis to store config and state data



## Running dapr
Locally
`dapr run --app-id uc-dapr  --dapr-http-port 3500 --dapr-grpc-port 3501 --resources-path ./components/local  --log-level debug`

Dev
 `dapr run --app-id uc-dapr  --dapr-http-port 3500 --dapr-grpc-port 3501 --resources-path ./components/dev`


supported `log-level` is debug, info, warn, error, fatal, or panic (default "info")

## Configuration Store:

1) Ensure redis and dapr is installed and running

2) Optional, connect to redis cluster and manually add configurations (Key-Value Pairs)
	
    example: 

	`redis-cli -p 6379`

	`MSET ACCOUNT_GRPC_PORT "5000"`
3) loading/updating config data into redis for dapr config store

	- You can find the json files in `configurations` folder for each env
	- Update json file with your config in `configurations` folder
	- Run following command to update config records in redis

		`npm run update-config` for local env

		`npm run update-config:dev` for dev env

4) use below url to access config items over http

	`GET http://localhost:3500/v1.0-alpha1/configuration/<config-store-name>?key=<key-name>`

5) config store name
local `local-config-store`

dev `dev-config-store`

## Secrets Store:
1) Ensure dapr is installed and running

2) loading/updating seceret data dapr secret store
	- You can find the json files in `secrets` folder for each env
	- Update json file with your config in `secrets` folder
3) Stop dapr and restart the dapr using command
Locally
`dapr run --app-id uc-dapr  --dapr-http-port 3500 --dapr-grpc-port 3501 --resources-path ./components/local  --log-level debug`

Dev
 `dapr run --app-id uc-dapr  --dapr-http-port 3500 --dapr-grpc-port 3501 --resources-path ./components/dev`
	
4) use below url to access secrets mentioned `secrets/<env>.json` over http

	`GET http://localhost:3500/v1.0-alpha1/secrets/<secret-store-name>/<secret-name>`

5) secret store name
local `local-secret-store`

dev `dev-secret-store`



## State Store:

1) Ensure redis and dapr is installed and running

2) No need to update/add state store manually

3) use below url to access state items over http

	GET http://localhost:3500/v1.0-alpha1/state/<state-store-name>/<key-name>

6) state store name
local `local-state-store`

dev `dev-state-store`

**WARNING**

No secrets values must be committed (pushing to github) `secrets/<env>.json` file, 

committing keys with empty "" values are allowed, but not the acutal secret values for the keys 

## API token authentication in Dapr
**Create a token using below command**

openssl rand 16 | base64

**when you use this command generate token like this bGSW0Zxf9tEHpFoVuQZupg==
## Configure API token authentication in Dapr 
export DAPR_API_TOKEN= add your token here
**After exporting Token, 

To rotate the configured token, update the DAPR_API_TOKEN environment variable to the new value and restart the daprd process.

After restart- you can test the api by passing the token in the header like below

pass the token in header

curl -H "Content-Type: application/json" \
 -H "dapr-api-token: <<YOUR TOKEN>>" \
 -X GET \
 http://localhost:3500/v1.0-alpha1/configuration/<config-store-name>?key=<key-name>



