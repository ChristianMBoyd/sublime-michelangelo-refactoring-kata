DEPS_DIR := deps/sm64

BASEROM_SOURCE := baserom/baserom.us.z64
BASEROM_TARGET := $(DEPS_DIR)/baserom.us.z64

BUILD_FROM_DEPS_DOCKER_COMPOSE := docker compose -f docker/build-sm64-from-deps/docker-compose.yaml

default: build-from-deps

build-from-deps:
	@echo "Copying over base rom..."
	@cp $(BASEROM_SOURCE) $(BASEROM_TARGET)
	$(BUILD_FROM_DEPS_DOCKER_COMPOSE) up --build -d
	@docker logs -f sm64-deps

download-deps: clean-deps
	@mkdir -p deps/sm64
	git clone https://github.com/n64decomp/sm64.git $(DEPS_DIR)

clean-deps:
	@echo "Removing any existing build artifacts..."
	@$(BUILD_FROM_DEPS_DOCKER_COMPOSE) run --rm sm64-deps rm -rf /sm64/*
	@echo "Removing previously downloaded dependencies..."
	@$(RM) -r deps/sm64