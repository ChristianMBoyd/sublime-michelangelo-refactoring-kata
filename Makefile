default: build-from-deps

build-from-deps:
	docker compose -f docker/build-sm64-from-deps/docker-compose.yaml up --build -d
	@docker logs -f sm64-deps

download-deps:
	@mkdir -p deps/sm64
	git clone https://github.com/n64decomp/sm64.git deps/sm64
	@echo "Copying over base rom..."
	@cp baserom/baserom.us.z64 deps/sm64/baserom.us.z64
	@echo "All set up!"

clean-deps:
	$(RM) -r deps