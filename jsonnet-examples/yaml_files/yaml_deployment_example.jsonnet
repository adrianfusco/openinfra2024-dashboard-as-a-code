local containerImage = std.extVar('containerImage');
local containerImageTag = std.extVar('containerImageTag');
local applicationPort = std.parseInt(std.extVar('applicationPort'));
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

// $ jsonnet yaml_deployment_example.jsonnet --ext-str containerImage=nginx --ext-str containerImageTag=latest --ext-str applicationPort=80 --ext-str replicas=3 | kubectl apply -f -
// deployment.apps/webserver-deployment created