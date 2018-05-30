.PHONY: build prepare run

COMPOSE = docker-compose -f compose/server.yaml -f compose/client.yaml  -f compose/proxy.yaml

default: run

build:
	$(COMPOSE) build slanger-client

prepare:
	$(COMPOSE) up -d slanger-server
	$(COMPOSE) run --rm slanger || true

run: prepare
	$(COMPOSE) up slanger-client

down:
	@$(COMPOSE) down
