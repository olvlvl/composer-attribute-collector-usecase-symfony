.PHONY: test-container
test-container:
	@-docker-compose -f docker-compose.collector.yml run --rm app bash
	@docker-compose -f docker-compose.collector.yml down -v
