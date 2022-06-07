SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
### End of preamble

#SERVICEACCOUNT="<separate SA for deployer service>"

VERSION=$(shell cat VERSION)
SRC_FILES= $(shell find . -type f -name "*.go")
#IMAGE_NAME=<>

##### Vanity Targets #####

.PHONY: build
build: bin/server

.PHONY: run-local
run-local: build
	./bin/server

.PHONY: dev-up
dev-up:
#	docker-compose -f pinot/docker-compose/docker-compose.yml up -d

.PHONY: dev-down
dev-down:
#	docker-compose -f pinot/docker-compose/docker-compose.yml down
