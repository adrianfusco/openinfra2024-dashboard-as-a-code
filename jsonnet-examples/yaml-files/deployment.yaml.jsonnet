local containerImage = std.extVar('containerImage');
local containerImageTag = std.extVar('containerImageTag');
local applicationPort = std.parseInt(std.extVar('appPort'));
local replicas = std.parseInt(std.extVar('replicas'));

std.manifestYamlDoc({
  apiVersion: 'apps/v1',
  kind: 'Deployment',
  metadata: {
    name: 'webserver-deployment',
  },
  spec: {
    replicas: replicas,
    selector: {
      matchLabels: {
        app: containerImage,
      },
    },
    template: {
      metadata: {
        labels: {
          app: containerImage,
        },
      },
      spec: {
        containers: [
          {
            name: containerImage,
            image: containerImage + ':' + containerImageTag,
            ports: [
              {
                containerPort: applicationPort,
              },
            ],
            livenessProbe: {
              httpGet: {
                path: '/',
                port: applicationPort,
              },
            },
          },
        ],
      },
    },
  },
})
