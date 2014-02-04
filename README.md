screenshot_as_a_service Cookbook
================================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwich.

Requirements
------------

### platform

CentOS


#### packages
- `nodejs` - screenshot_as_a_service needs nodejs to be installed
- `phantomjs` - screenshot_as_a_service needs phantomjs to be installed


Attributes
----------

#### screenshot_as_a_service::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['screenshot_as_a_service']['app_dir']</tt></td>
    <td>String</td>
    <td>Where to install screenshot_as_a_service</td>
    <td><tt>"/var/nodejs"</tt></td>
  </tr>
</table>

Usage
-----
#### screenshot_as_a_service::default

Just include `screenshot_as_a_service` in your node's `run_list`:

```json
{
  screenshot_as_a_service:{
      appdir:"/var/nodejs"
  },
  "run_list": [
    "recipe[screenshot_as_a_service]"
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
Authors: TODO: List authors
