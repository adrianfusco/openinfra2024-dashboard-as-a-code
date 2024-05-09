local grafonnet = import 'grafonnet-v10.4.0/main.libsonnet';
local dashLink = grafonnet.dashboard.link;
local transform = grafonnet.panel.table.transformation;

{
  dashboardUniqueIds():
    {
      'osp-ci-overview': std.md5('osp-ci-overview'),
      'zuul-openstack-downstream': std.md5('zuul-openstack-downstream'),
      'zuul-openstack-downstream-promotions': std.md5('zuul-openstack-downstream-promotions'),
      'zuul-openstack-downstream-components-per-rhel-9-rhos-17.1': std.md5('zuul-openstack-downstream-components-per-rhel-9-rhos-17.1'),
      'zuul-openstack-downstream-components-per-rhel-8-rhos-16.2': std.md5('zuul-openstack-downstream-components-per-rhel-8-rhos-16.2'),
      'zuul-openstack-downstream-components-per-rhel9-rhoso18.0': std.md5('zuul-openstack-downstream-components-per-rhel9-rhoso18.0'),
    },


  dashboardLinkUrl(title, url):
    dashLink.link.new(title, url)
    + dashLink.link.withIcon('dashboard'),

  linkTypeDashboardDrowdown(title):
    dashLink.dashboards.new(title, tags=[])
    + dashLink.dashboards.options.withAsDropdown(value=true)
    + dashLink.dashboards.options.withTargetBlank(value=true),

  dashboardLinkTag(title, tag):
    dashLink.dashboards.new(title, tag),

  reorderTableColumns():
    transform.withId('organize')
    + transform.withOptions({
      indexByName: {
        branch: 7,
        build_name: 0,
        log_url: 6,
        message: 8,
        project: 9,
        build_status: 1,
        tenant: 10,
      },
    }),

  // Columns Renaming to avoid having same fields than Opensearch
  renameColumns():
    transform.withId('organize')
    + transform.withOptions({
      renameByName: {
        branch: 'Branch',
        build_name: 'Job',
        log_url: 'Log URL',
        message: 'Message',
        project: 'Project',
        build_status: 'Status',
        tenant: 'Tenant',
      },
    }),

  selectTableColumns():
    transform.withId('filterFieldsByName')
    + transform.withOptions({
      include: {
        names: [
          'build_name',
          'project',
          'branch',
          'log_url',
          'tenant',
          'message',
          'build_status',
        ],
      },
    }),

  selectPieChartColumns():
    transform.withId('filterFieldsByName')
    + transform.withOptions({
      include: {
        names: [
          'build_name',
          'build_status',
        ],
      },
    }),

  reorderPieChartColumns():
    transform.withId('organize')
    + transform.withOptions({
      indexByName: {
        build_name: 0,
        build_status: 1,
      },
    }),

  renamePieChartColumns():
    transform.withId('organize')
    + transform.withOptions({
      renameByName: {
        build_name: 'Job',
        build_status: 'Status',
      },
    }),

  groupPieChartByColumns():
    transform.withId('groupBy')
    + transform.withOptions({
      fields: {
        Job: {
          operation: 'aggregate',
          aggregations: ['count'],
        },
        Status: {
          operation: 'groupby',
          aggregations: [],
        },
      },
    }),

}

