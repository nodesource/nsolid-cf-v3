# nsolid-cf-v3 developer info

If you're maintaining this repo, this file is for you!

The only general maintainence of this app is to update the version of
N|Solid Console that gets deployed.

To do that, edit the file `nsolid-console-app/setup.sh` and change
the `BUNDLE` and `VERSION` variables appropriately.  At the time of this
writing, they are always the same, but in the future that could change.

Once you've tested that by deploying the samples to a Cloud FOundry env,
you should commit that change and merge to master.

## testing

To test running the console server and the sample apps in a Cloud Foundry
instance like [Pivotal Web Services][], you will want to customize a few
things.

The `tools` directory contains two scripts `push-samples-pjm.sh` and
`stop-samples-pgm.sh`.  They are used, respectively, to start and stop
the console and the sample apps.

They expect manifest files in the app directories named `manifest-pjm.yml`,
which you won't see, as they are `.gitignore`d.  They have specialized
manifests specifically for deploying in the env that I deploy in.  Basically
just the app name is different, prefixed with `pjm-`, compared to the
`manifest.yml` available in the same directory.

The only `-pjm` manifest that's likely to be significantly than the one in
the repo is `nsolid-console-app/manifest-pjm.yml`.  Here are it's contents:

```
---
applications:
- name:      pjm-nsolid-console
  buildpack: https://github.com/nodesource/nsolid-buildpack-cf-v3.git
  memory:    1024M
  instances: 1
  command:   bash launch-console.sh

  # NSOLID_LICENSE - your N|Solid license should go in here
  # NSOLID_CONSOLE_NOTIFICATION_CONSOLE_URL - URL to the N|Solid Console, for use
  #   in sending notification emails with links back to the console
  # NSOLID_CF_RUN_AGENT - set to false to not have N|Solid Console monitor itself
  # NSOLID_CF_RUN_TUNNELS - should always be set to false for the N|Solid Console server

  env:
    NSOLID_CONSOLE_LICENSE_KEY:              'your nsolid license goes here'
    NSOLID_CONSOLE_NOTIFICATION_CONSOLE_URL: https://pjm-nsolid-console.cfapps.io
    NSOLID_CF_RUN_AGENT:                     true
    NSOLID_CF_RUN_TUNNELS:                   false

  # apps using the N|Solid buildpack should bind to the nsolid-console
  # user-provided service
  services:
    - nsolid-console

```

You will likely want a similar set of scripts to start and stop your own
versions of the samples, but leaving the apps named with `pjm-` prefix, and
the manfiests as `manifest-pjm.yml` in your local directory is of course fine,
and maintains the `pjm` dyntasty.

[Pivotal Web Services]: https://run.pivotal.io/