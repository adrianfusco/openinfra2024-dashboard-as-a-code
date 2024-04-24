# OpenInfra 2024 - Dashboards as Code: managing Grafana with JSONNet

*Authors: Szymon Datko, Adrian Fusco Arnejo*

Abstract: Creating dashboards and visualizations on Grafana can be a simple task, but when we need
to create dozens of dashboards it could require more time and a lot of manual work. Here is
where the Grafana as a Code appears – a very good option to write simple code to generate
dozens of automated and centralized visualizations that will make you avoid repetitive tasks,
copy and pastes, manual work, among all other things.

__

Docs:

- [jsonnet configuration language](https://jsonnet.org/)
- [jb - jsonnet bundler](https://github.com/jsonnet-bundler/jsonnet-bundler)
- [grafonnet - a jsonnet library for generating Grafana dashboards](https://github.com/grafana/grafonnet)
- [Grafonnet API for building dashboards](https://grafana.github.io/grafonnet/API/index.html)


## Executing jsonnet

```bash
$ cd jsonnet
# Build docker image that contains jsonnet, grafonnet and jb with the vendor
$ docker build -t jsonnet-image .
# Specify the jsonnet file that we wanna convert into JSON grafana model
$ JSONNET_DASHBOARD_FILE=./zuul-dashboard.jsonnet docker run -e JSONNET_FILE=/jsonnet_file.jsonnet -v
 "$JSONNET_DASHBOARD_FILE":/jsonnet_file.jsonnet jsonnet-image /jsonnet_file.jsonnet
{
   "schemaVersion": 36,
   "time": {
      "from": "now-6h",
      "to": "now"
   },
   "timezone": "utc",
   "title": "My Dashboard"
```

## Executing Grafana docker instance

```bash
$ cd grafana
$ docker compose up --build
```

We can access now in [http://localhost:3000/](http://localhost:3000/) and find our dashboards in the `OSP-CI` folder.
