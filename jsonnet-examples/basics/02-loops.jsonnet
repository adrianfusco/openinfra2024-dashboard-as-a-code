local protocol_information = {
  protocols: [
    {
      port: 3306,
      type: "mysql",
      description: "MySQL database service (also for MariaDB)",
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
