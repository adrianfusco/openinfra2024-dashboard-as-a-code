local xml = import 'xml.libsonnet';

local logo = xml.Element('svg', '') {
  version: '1.1',
  xmlns: 'http://www.w3.org/2000/svg',
  x: 0,
  y: 0,
  bg:: xml.Element('linearGradient', '') {
    id: 'bg',
    gradientUnits: 'userSpaceOnUse',
    has: [
      xml.Element('stop', '') {
        offset: 0,
        'stop-color': 'red',
      },
      xml.Element('stop', '') {
        offset: 1,
        'stop-color': 'red',
      },
    ],
  },
  fill::  xml.Element('path', '') {
    fill: 'url(#bg)',
    cmds:: [
      'M127.47 83.49c12.51 0 61-2.58 30.61-17.46a14 14 0 0 0-.31-3.42l-7.45-32.36c-1.72-7.12-3.23-10.35-15.73-16.6C124.89 8.69 103.76.5 97.51.5 91.69.5 90 8 83.06 8c-6.68 0-11.64-5.6-17.89-5.6-6 0-9.91 4.09-12.93 12.5 0 0-8.41 23.72-9.49 27.16a6.43 6.43 0 0 0-.22 1.94c0 9.22 36.3 39.45 84.94 39.45M160 72.07c1.73 8.19 1.73 9.05 1.73 10.13 0 14-15.74 21.77-36.43 21.77-46.76.03-87.72-27.37-87.72-45.48a18.45 18.45 0 0 1 1.51-7.33C22.27 52 .5 55 .5 74.22c0 31.48 74.59 70.28 133.65 70.28 45.28 0 56.7-20.48 56.7-36.65 0-12.72-11-27.16-30.83-35.78',
    ],
    d: std.join('', self.cmds)
  },
  has: [
    $.bg,
    $.fill,
  ],
};

xml.manifestXmlObj(logo)
