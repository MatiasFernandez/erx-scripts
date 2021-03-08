# erx-scripts
A collection of useful scripts to run in the Edgerouter X

## Healthchecks.io script

This is useful to report the internet connection status to a remote service. If the service does not receive a "ping" after certain amount of time, it will trigger a notification. I use it to get notified when I have internet issues in my house.

When the ping fails, I log some useful information in case I want to debug the issue. I perform two checks after the request to Healthchecks.io failed:

1. Is the router able to reach Cloudflare DNS servers?
2. Is the router able to reach my ISP's modem?

This information is useful to understand which component may be down.

Note: You need to define your own "ping id" in the Healthchecks.io URL