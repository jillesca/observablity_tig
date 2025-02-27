include .env.example
-include .env
export

build-tig:
	$(MAKE) clean-tig
	docker compose up --build --detach telegraf influxdb grafana

run-tig:
	$(MAKE) clean-tig
	docker compose up --detach telegraf influxdb grafana

follow:
	docker compose logs --follow

clean-tig:
	-docker compose down telegraf influxdb grafana
	-docker compose rm -f telegraf influxdb grafana
