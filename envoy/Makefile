
PWD ?= $(shell pwd)
UID ?= $(shell id -u)
GID ?= $(shell id -g)


create:
	podman run -d  -v ${PWD}/envoy.yaml:/etc/envoy/envoy.yaml:z  -v  ${PWD}/certs:/opt/certs:z  --network host --name envoy-authz -u ${UID}:${GID}  envoyproxy/envoy-alpine:v1.18.3

stop: 
	podman stop envoy-authz

start: 
	podman start envoy-authz

restart: 
	podman restart envoy-authz

remove: 
	podman rm -f envoy-authz

## Backend Echo Server
create-backend: 
	podman run -d --name backend-echo --network host -e PORT=3000 ealen/echo-server:0.5.0

stop-backend: 
	podman stop backend-echo

start-backend: 
	podman start backend-echo

restart-backend: 
	podman restart backend-echo

remove-backend: 
	podman rm -f backend-echo