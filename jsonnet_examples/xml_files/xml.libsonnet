// The original example was taken from: https://jsonnet.org/articles/output-formats.html
// Modified the example for being able to include content in the tags and
// not just attributes
// Some utility functions for generating XML.
{
  manifestXmlObj(value)::
    local aux(v, cindent) =
      if !std.isObject(v) then
        error 'Expected a object, got %s'
              % std.type(value)
      else
        local attrs = [
          ' %s="%s"' % [k, v.attrs[k]]
          for k in std.objectFields(v.attrs)
        ];
        if std.length(v.has) > 0 then
          std.deepJoin([
            cindent,
            '<',
            v.tag,
            attrs,
            '>\n',
            [
              aux(x, cindent + '  ')
              for x in v.has
            ],
            cindent,
            '</',
            v.tag,
            '>\n',
          ])
        else
          std.deepJoin([
            cindent,
            '<',
            v.tag,
            attrs,
            '>',
            v.content,
            '</',
            v.tag,
            '>\n',
          ]);
    aux(value, ''),

  Element(tag, content):: {
    local element = self,
    tag:: tag,
    attrs:: {
      [k]: element[k]
      for k in std.objectFields(element)
      if k != 'tag' && k != 'content'
    },
    has:: [],
    content:: content,
  },
}
