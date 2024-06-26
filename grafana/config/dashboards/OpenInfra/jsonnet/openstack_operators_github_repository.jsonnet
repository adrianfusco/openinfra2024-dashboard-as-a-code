local grafonnet = import 'grafonnet-v10.4.0/main.libsonnet';
local dashboard = grafonnet.dashboard;
local textPanel = grafonnet.panel.text;

# We can create templates
local repositoriesUrlTemplate = |||
  <h2><a href="https://github.com/openstack-k8s-operators/%s">Go to GitHub %s Repository</a></h2>
|||;

local repositories = ['ci-framework', 'openstack-operator', 'dataplane-operator', 'openstack-ansibleee-operator'];

# We can make variable substitution
local renderedRepositoriesTemplate = [repositoriesUrlTemplate % [repository, repository] for repository in repositories];

# We can create visualizations
local textPanelVisualization =
  textPanel.new('Openstack on Openshift GitHub Repositories')
  + textPanel.gridPos.withH(22)
  + textPanel.gridPos.withW(10)
  + textPanel.options.withContent(value=std.join("", renderedRepositoriesTemplate))
;

# We can create the main dashboard
dashboard.new('OpenInfra 2024 Germany')
  + dashboard.withDescription('This is how we generate a description for our dashboard')
  + dashboard.withTags('openinfra2024')
  # And then insert the visualizations inside the dashboard
  + dashboard.withPanels([textPanelVisualization]) 


