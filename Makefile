build-from-deps:
	docker compose -f docker/build-sm64-from-deps/docker-compose.yaml up --build -d
	@docker logs -f sm64-deps