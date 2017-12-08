nsolid-cf - Running the N|Solid Console server as a Cloud Foundry app
================================================================================

**Note: this server is NOT designed to be scaled with Cloud Foundry.
You should only run one instance of this app.**

To run N|Solid Console as a Cloud Foundry app, do the following:

* ensure the [user-provided service `nsolid-console`][ups-nsolid-console] has
  been created

* run `./setup.sh` to download the N|Solid Console archive

* run `cf push`

You can validate the N|Solid Console server is operating correctly, by
`curl`'ing it's "home page", which prints it's current version in a JSON
object:

    $ curl http://nsolid-console.local.pcfdev.io
    {"version":"x.y.z"}


customization
--------------------------------------------------------------------------------

The following environment variables may be set on the app itself, or saved in
the `manifest.yml` file in the `env` stanza.

* `NSOLID_LICENSE` can be set to your N|Solid licenses, so that the N|Solid
  Console won't prompt for it the next time the N|Solid Console server restarts.
  If you don't already have an N|Solid license, run this app and the N|Solid
  Console app once, to register and obtain a license, then set this env var
  and `cf push` the app again.

* `NSOLID_CONSOLE_NOTIFICATION_CONSOLE_URL` should be set to the URL of the
  N|Solid Console server.  This URL is used in notification emails which
  contain links back to the N|Solid Console server.

* `NSOLID_CF_RUN_AGENT` can be set to `false` to indicate the N|Solid agent
  should not be used with this app, so that it won't connect to the N|Solid
  Console server or be visible in the N|Solid Console

* `NSOLID_CF_RUN_TUNNELS` should be set to false so that tunnels are not run
  when having the N|Solid Console's runtime agent connect back to itself


[N|Solid buildpack]: https://github.com/nodesource/nsolid-buildpack-cf-v3
[ups-nsolid-console]: https://github.com/nodesource/nsolid-buildpack-cf-v3#user-provided-service-nsolid-console
