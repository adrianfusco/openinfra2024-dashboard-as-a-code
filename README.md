# Dashboards as a Code: managing Grafana with Jsonnet

This repository contains supplementary materials for our presentation
at the OpenInfra Day Germany 2024.


## Abstract

Creating dashboards and visualizations on Grafana can be a simple task, but when we need
to create dozens of dashboards it could require more time and a lot of manual work. Here is
where the Grafana as a Code appears – a very good option to write simple code to generate
dozens of automated and centralized visualizations that will make you avoid repetitive tasks,
copy and pastes, manual work, among all other things.


## Useful links


### Jsonnet

- [Jsonnet official website](https://jsonnet.org/)
- [Jsonnet repository](https://github.com/google/jsonnet)


### Jsonnet Bundler

- [jb - jsonnet bundler](https://github.com/jsonnet-bundler/jsonnet-bundler)


### Grafonnet library

- [Grafonnet repository](https://github.com/grafana/grafonnet)
- [Grafonnet API documentation](https://grafana.github.io/grafonnet/API/index.html)
- [Extra libraries by Grafana Labs](https://github.com/grafana/jsonnet-libs/tree/master)


## Jsonnet

We present examples in Jsonnet language. It is worth to take a look at those
before jumping to the `grafonnet` section, since it is needed to understand
Jsonnet for creating dashboards and visualizations.

All the Jsonnet examples are under the [jsonnet-examples](./jsonnet-examples/README.md).


## Grafana and grafonnet examples

We setup a local environment with Grafana using docker image with `jsonnet`
& `grafonnet` to generate the JSON models that Grafana can understand.

We provide a `docker-compose.yml` to simplify setting up the Grafana sandbox.
Everything is configured already to fetch from the `opensearch` data source
that is publicly available. Also, a dashboard from generated JSON model
will appear in the deployed instance once we execute `docker compose up`.

For more information follow the [grafana](./grafana/README.md) folder of this repository.


## Authors

Szymon Datko, Adrian Fusco Arnejo
