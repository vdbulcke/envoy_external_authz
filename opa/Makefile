PWD ?= $(shell pwd)
UID ?= $(shell id -u)
GID ?= $(shell id -g)

## OPA
create-opa: 
	podman run -d  -v ${PWD}/opa_policy:/policy:z -v ${PWD}/opa_config:/config:z --network host --name opa -u ${UID}:${GID}  openpolicyagent/opa:latest-envoy run   --server --addr=localhost:8181 --set=plugins.envoy_ext_authz_grpc.addr=:9191 --set=decision_logs.console=true --ignore=.* /policy/policy.rego

stop-opa: 
	podman stop opa

start-opa: 
	podman start opa

restart-opa: 
	podman restart opa

remove-opa: 
	podman rm -f opa


## Envoy
create-envoy:
	podman run -d  -v ${PWD}/envoy.yaml:/etc/envoy/envoy.yaml:z  --network host --name envoy-opa -u ${UID}:${GID}  envoyproxy/envoy-alpine:v1.18.3

stop-envoy: 
	podman stop envoy-opa

start-envoy: 
	podman start envoy-opa

restart-envoy: 
	podman restart envoy-opa

remove-envoy: 
	podman rm -f envoy-opa


## Backend Echo Server
create-backend: 
	podman run -d --name backend-echo -p 3000:80  ealen/echo-server:0.5.0

stop-backend: 
	podman stop backend-echo

start-backend: 
	podman start backend-echo

restart-backend: 
	podman restart backend-echo

remove-backend: 
	podman rm -f backend-echo

## Rego 
opa-eval: 
	opa eval --data opa_policy/policy.rego --input opa_policy/input.json "data.envoy.authz.allow"
