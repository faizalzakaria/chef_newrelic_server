chef_newrelic_server Cookbook
=============================

This cookbook install NewRelic server monitoring for you. It supports centos, redhat, debian and ubuntu.

Requirements
------------

None.

Attributes
----------

e.g.
#### chef_newrelic_server::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['newrelic_server']['license_key']</tt></td>
    <td>String</td>
    <td>Newrelic license key (it has to be 40 characeters)</td>
    <td><tt>15b950bda6ac554663e507d39c45e91c20418103</tt></td>
  </tr>
</table>

Usage
-----
#### chef_newrelic_server::default

e.g.
Just include `chef_newrelic_server` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef_newrelic_server]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: [ Faizal F Zakaria ]
