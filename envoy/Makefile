
PWD ?= $(shell pwd)
UID ?= $(shell id -u)
GID ?= $(shell id -g)


create:
	podman run -d  -v ${PWD}/envoy.yaml:/etc/envoy/envoy.yaml:z  --network host --name envoy-authz -u ${UID}:${GID}  envoyproxy/envoy-alpine:v1.18.3

stop: 
	podman stop envoy-authz

start: 
	podman start envoy-authz

restart: 
	podman restart envoy-authz

remove: 
	podman rm -f envoy-authz

