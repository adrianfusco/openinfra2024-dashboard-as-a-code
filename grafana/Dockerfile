FROM grafana/grafana:8.3.7

# Map dashboards, plugins and datasources configuration
ADD ./config/provisioning /etc/grafana/provisioning

# Map grafana config
ADD ./config/grafana.ini /etc/grafana/grafana.ini

# Map dashboards
ADD ./config/dashboards /var/lib/grafana/dashboards

# Map secrets
ADD ./config/secrets /etc/grafana/secrets

ENV GF_AUTH_ANONYMOUS_ENABLED=true
ENV GF_AUTH_ANONYMOUS_ORG_ROLE=Viewer
ENV GF_USERS_ALLOW_SIGN_UP='true'
ENV GF_SECURITY_ADMIN_PASSWORD__FILE='/etc/grafana/secrets/admin_password'
ENV GF_SECURITY_ADMIN_USER__FILE='/etc/grafana/secrets/admin_user'

# Plugins that will be downloaded in the image build process
ENV GF_INSTALL_PLUGINS=grafana-opensearch-datasource
