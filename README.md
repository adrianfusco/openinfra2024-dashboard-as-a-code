# OpenInfra 2024 - Dashboards as Code: managing Grafana with JSONNet

## Abstract

Creating dashboards and visualizations on Grafana can be a simple task, but when we need
to create dozens of dashboards it could require more time and a lot of manual work. Here is
where the Grafana as a Code appears – a very good option to write simple code to generate
dozens of automated and centralized visualizations that will make you avoid repetitive tasks,
copy and pastes, manual work, among all other things.

## Useful Links

### Jsonnet

- [jsonnet configuration language](https://jsonnet.org/)
- [jsonnet repository](https://github.com/google/jsonnet)

### jsonnet bundler

- [jb - jsonnet bundler](https://github.com/jsonnet-bundler/jsonnet-bundler)

### Grafonnet Library

- [grafonnet - a jsonnet library for generating Grafana dashboards](https://github.com/grafana/grafonnet)
- [Grafonnet API for building dashboards](https://grafana.github.io/grafonnet/API/index.html)
- [Extra libraries developed on jsonnet by Grafana Labs](https://github.com/grafana/jsonnet-libs/tree/master)

## jsonnet examples

All the jsonnet examples will be under the [jsonnet-examples](./jsonnet_examples/README.md).

## Grafana and grafonnet examples

We can setup a local environment with Grafana and and a local docker image with jsonnet & grafonnet to generate the JSON models that Grafana can understand.
We can find more information [grafana](./grafana/README.md).

## Authors

Szymon Datko, Adrian Fusco Arnejo
