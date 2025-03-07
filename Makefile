include .env.example
-include .env
export


# Check if docker is available, otherwise use podman
DOCKER := $(shell command -v docker 2> /dev/null || echo podman)

build-tig:
	$(MAKE) clean-tig
	$(DOCKER) compose up --build --detach telegraf influxdb grafana

run-tig:
	$(MAKE) clean-tig
	$(DOCKER) compose up --detach telegraf influxdb grafana

follow:
	$(DOCKER) compose logs --follow

clean-tig:
	-$(DOCKER) compose down telegraf influxdb grafana
	-$(DOCKER) compose rm -f telegraf influxdb grafana