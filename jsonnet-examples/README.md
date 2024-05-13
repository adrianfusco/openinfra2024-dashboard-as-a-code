# Jsonnet examples


## Requirements

You need to install [jsonnet](https://github.com/google/jsonnet) for being able
to use the Jsonnet command line interpreter and convert the `.jsonnet` files.


## Basics


### Hello World!

```bash
jsonnet -e '{"hello": "world"}'
```

Output:

```bash
{
   "hello": "world"
}
```


### Sum

```bash
jsonnet -e '
    local numbers = [5, 1, 2, 3];
    
    std.foldl(
      function(x, y) (x + y),
      numbers,
      0
    )
'
```

Output:

```bash
11
```


### Loops

```bash
jsonnet -e '
    local protocol_information = {
      protocols: [
        {
          port: 3306,
          type: "mysql",
          description: "MySQL/MariaDB service",
        },
        {
          port: 443,
          type: "https",
          description: "HTTPS (HTTP over SSL/TLS)",
        },
        {
          port: 80,
          type: "http",
          description: "Hypertext transfer protocol",
        },
      ],
    };
    
    {
      protocol_information: [
        {
          [(p.port + "/" + p.type)]: p.description,
        }
        for p in protocol_information.protocols
      ],
    }
'
```

Output:

```bash
{
   "protocol_information": [
      {
         "3306/mysql": "MySQL/MariaDB service"
      },
      {
         "443/https": "HTTPS (HTTP over SSL/TLS)"
      },
      {
         "80/http": "Hypertext transfer protocol"
      }
   ]
}
```


### Conditionals

```bash
jsonnet -e '
    local numbers = [1, 2, 3, 4, 5];
    
    {
      numbers: [
        if n % 2 == 0 then
          {
            number: n,
            type: "even",
          }
        else
          {
            number: n,
            type: "odd",
          }
        for n in numbers
      ],
    }
'
```

Output:

```bash
{
   "numbers": [
      {
         "number": 1,
         "type": "odd"
      },
      {
         "number": 2,
         "type": "even"
      },
      {
         "number": 3,
         "type": "odd"
      },
      {
         "number": 4,
         "type": "even"
      },
      {
         "number": 5,
         "type": "odd"
      }
   ]
}
```


## Other output formats using Jsonnet


### Generate INI file

Example in: [supervisord.conf.ini.jsonnet](./ini-files/supervisord.conf.ini.jsonnet)

```bash
jsonnet -S ini-files/supervisord.conf.ini.jsonnet 
```

Output:

```bash
[program:flask_app_api]
autorestart = true
autostart = true
command = gunicorn flask_app_api.py
directory = /home/fedora/apps/
stderr_logfile = logs/flas_app_api.err.log
stdout_logfile = logs/flas_app_api.out.log
[program:flask_app_backend]
autorestart = true
autostart = true
command = gunicorn flask_app_backend.py
directory = /home/fedora/apps/
stderr_logfile = logs/flas_app_backend.err.log
stdout_logfile = logs/flas_app_backend.out.log
[program:flask_app_frontend]
autorestart = true
autostart = true
command = gunicorn flask_app_frontend.py
directory = /home/fedora/apps/
stderr_logfile = logs/flas_app_frontend.err.log
stdout_logfile = logs/flas_app_frontend.out.log
[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface
[supervisord]
directory = /tmp
logfile = /tmp/supervisord.log
logfile_backups = 5
logfile_maxbytes = 75MB
loglevel = info
pidfile = /tmp/supervisord.pid
user = fedora
```


### Generate XML

Example in: [response.xml.jsonnet](./xml-files/response.xml.jsonnet)

```bash
jsonnet -S xml-files/response.xml.jsonnet --ext-str id=$(uuidgen)
```

Output:

```bash
<xml encoding="utf-8" version="1.0">
  <statusCode>200</statusCode>
  <id>5a17a54b-c9ec-4d6a-a961-06be8e8b614a</id>
  <parametersData>
    <requestName>getLocation</requestName>
    <parameters>
      <timeZone>Europe/Madrid</timeZone>
    </parameters>
  </parametersData>
  <responseData>
    <dayOfTheWeek>Thursday</dayOfTheWeek>
    <date>05/09/2024</date>
    <time>18:06</time>
  </responseData>
</xml>
```


### Generate SVG

Example in: [fedora.svg.jsonnet](./xml-files/fedora.svg.jsonnet)

```bash
jsonnet -S xml-files/fedora.svg.jsonnet 
```

Output:

```bash
<svg version="1.1" x="0" xmlns="http://www.w3.org/2000/svg" y="0">
  <linearGradient gradientUnits="userSpaceOnUse" id="bg">
    <stop offset="0" stop-color="red"></stop>
    <stop offset="1" stop-color="red"></stop>
  </linearGradient>
  <path d="M127.47 83.49c12.51 0 61-2.58 30.61-17.46a14 14 0 0 0-.31-3.42l-7.45-32.36c-1.72-7.12-3.23-10.35-15.73-16.6C124.89 8.69 103.76.5 97.51.5 91.69.5 90 8 83.06 8c-6.68 0-11.64-5.6-17.89-5.6-6 0-9.91 4.09-12.93 12.5 0 0-8.41 23.72-9.49 27.16a6.43 6.43 0 0 0-.22 1.94c0 9.22 36.3 39.45 84.94 39.45M160 72.07c1.73 8.19 1.73 9.05 1.73 10.13 0 14-15.74 21.77-36.43 21.77-46.76.03-87.72-27.37-87.72-45.48a18.45 18.45 0 0 1 1.51-7.33C22.27 52 .5 55 .5 74.22c0 31.48 74.59 70.28 133.65 70.28 45.28 0 56.7-20.48 56.7-36.65 0-12.72-11-27.16-30.83-35.78" fill="url(#bg)"></path>
</svg>
```

Result:

![Red Hat SVG](./xml-files/fedora.svg)


### Generate YAML

Example in: [deployment.yaml.jsonnet](./yaml-files/deployment.yaml.jsonnet)

```bash
jsonnet -S yaml-files/deployment.yaml.jsonnet \
    --ext-str containerImage=nginx \
    --ext-str containerImageTag=latest \
    --ext-str appPort=80 \
    --ext-str replicas=3
```

Output:

```bash
"apiVersion": "apps/v1"
"kind": "Deployment"
"metadata":
  "name": "webserver-deployment"
"spec":
  "replicas": 3
  "selector":
    "matchLabels":
      "app": "nginx"
  "template":
    "metadata":
      "labels":
        "app": "nginx"
    "spec":
      "containers":
      - "image": "nginx:latest"
        "livenessProbe":
          "httpGet":
            "path": "/"
            "port": 80
        "name": "nginx"
        "ports":
        - "containerPort": 80
```
