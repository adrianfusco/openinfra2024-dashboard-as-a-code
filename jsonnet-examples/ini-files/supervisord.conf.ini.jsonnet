local app_names = ['api', 'frontend', 'backend'];

std.manifestIni({
  sections: {
    supervisord: {
      user: 'fedora',
      directory: '/tmp',
      logfile: '/tmp/supervisord.log',
      logfile_maxbytes: '75MB',
      logfile_backups: 5,
      loglevel: 'info',
      pidfile: '/tmp/supervisord.pid',
    },
    'rpcinterface:supervisor': {
      'supervisor.rpcinterface_factory': 'supervisor.rpcinterface:make_main_rpcinterface',
    },
  } + {
    ['program:flask_app_' + app]: {
      command: 'gunicorn flask_app_' + app + '.py',
      directory: '/home/fedora/apps/',
      autostart: true,
      autorestart: true,
      stderr_logfile: 'logs/flas_app_' + app + '.err.log',
      stdout_logfile: 'logs/flas_app_' + app + '.out.log',
    }
    for app in app_names
  }})

// jsonnet -S supervisord_conf_ini.jsonnet
