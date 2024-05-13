// jsonnet -S xml_request_response_example.jsonnet --ext-str id=$(uuidgen)

local xml = import 'xml.libsonnet';

local xmlResponseTemplate = xml.Element('xml', content='') {
  version: '1.0',
  encoding: 'utf-8',
  statusCode:: xml.Element('statusCode', content='200'),
  callID:: xml.Element('id', content=std.extVar('id')),
  parametersData:: xml.Element('parametersData', content='') {
    requestName:: xml.Element('requestName', content='getLocation'),
    has: [
      self.requestName,
      xml.Element('parameters', content='') {
        timeZone:: xml.Element('timeZone', content='Europe/Madrid'),
        has: [self.timeZone],
      },
    ],
  },
  responseData:: xml.Element('responseData', content='') {
    dayOfTheWeek:: xml.Element('dayOfTheWeek', content='Thursday'),
    date:: xml.Element('date', content='05/09/2024'),
    time:: xml.Element('time', content='18:06'),
    has: [self.dayOfTheWeek, self.date, self.time],
  },
  has: [$.statusCode, $.callID, $.parametersData, $.responseData],
};

xml.manifestXmlObj(xmlResponseTemplate)
