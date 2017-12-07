nsolid-cf - Using N|Solid on Cloud Foundry
================================================================================

This repository contains sample applications in the `sample-apps` directory
that use the [Cloud Foundry buildpack for N|Solid][N|Solid buildpack].

Before pushing any apps, you should create the `nsolid-console` user-provided
service using the [instructions provided in the buildpack][ups-nsolid-console].

After the `nsolid-console` user-provided service is created and you have the
N|Solid Console server running, you can use `cf push` to push
the apps to Cloud Foundry.

* `dillinger`

  The awesome open source [Dillinger](http://dillinger.io) application.

* `hello-world`

  A simple "Hello, World!" application.

* `print-versions-4x`

  Displays the versions of the Node.js and N|Solid Runtime components.
  Specifically selects the version of the N|Solid Runtime that corresponds to
  the Node.js 4.x Argon LTS line, via the `engines` property in the
  `package.json` file.

* `print-versions-6x`

  Same as `print-version-4x`, but uses the Node.js 6.x Boron LTS line

* `print-versions-8x`

  Same as `print-version-4x`, but uses the Node.js 8.x Carbon LTS line

* `native`

  A Node.js application which uses a native package, to ensure that native
  packages work with N|Solid in Cloud Foundry.


Running N|Solid servers as Cloud Foundry apps
================================================================================

This repository also contains the following components that allow you to run
N|Solid servers as Cloud Foundry apps on Pivotal Cloud Foundry, using the
[Cloud Foundry buildpack for N|Solid][N|Solid buildpack].

* [nsolid-console-app](nsolid-console-app/README.md)

  Run the N|Solid Console server as a Cloud Foundry app, allowing connections
  from the apps built with the Cloud Foundry buildpack for N|Solid.


General Notes
================================================================================

See the documentation for the
[Cloud Foundry buildpack for N|Solid][N|Solid buildpack] for more information
on:

* selecting which version of the N|Solid Runtime to use with your app

* creating a user-provided service named `nsolid-console` which will be used
  to connect your applications using N|Solid to the N|Solid Console server


Authors and Contributors
================================================================================

<table><tbody>
  <tr>
    <th align="left">Patrick Mueller</th>
    <td><a href="https://github.com/pmuellr">GitHub/pmuellr</a></td>
    <td><a href="https://twitter.com/pmuellr">Twitter/@pmuellr</a></td>
  </tr>
</tbody></table>


Contributing
================================================================================

Awesome!  We're happy that you want to contribute.

Make sure that you're read and understand the [Code of Conduct](CODE_OF_CONDUCT.md).


License & Copyright
================================================================================

**nsolid-cf** is Copyright (c) 2016 NodeSource and licensed under the
MIT license. All rights not explicitly granted in the MIT license are reserved.
See the included [LICENSE.md](LICENSE.md) file for more details.


[N|Solid buildpack]: https://github.com/nodesource/nsolid-buildpack-cf-v3
[ups-nsolid-console]: https://github.com/nodesource/nsolid-buildpack-cf-v3#user-provided-service-nsolid-console
