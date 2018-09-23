## New Relic Haproxy monitoring Plugin

Repurposed from https://github.com/railsware/newrelic_platform_plugins/tree/master/newrelic_haproxy_agent to work with Docker

## Docker

```
docker run -d oba11/newrelic-haproxy-agent
```

## Supported environment variables

`APP_NAME`: This is the newrelic application name, default is `my-haproxy`.<br/>
`STATS_URL`: URI of the haproxy CSV stats url, default is `http://127.0.0.1:1000/;csv`.<br/>
`PROXY_NAME`: The name of the proxy to monitor, check your haproxy stats page, default is `http_80`.<br/>
`PROXY_TYPE`: The type of the proxy to monitor (ex: 'frontend' or 'backend'), default is `backend`.<br/>
`AUTH_USER`: The username if the status page is protected under basic authentication.<br/>
`AUTH_PASS`: The password if the status page is protected under basic authentication.<br/>

---

The New Relic Haproxy Plugin enables monitoring of HAProxy – a TCP/HTTP load balancer – and reports the following data for a specified proxy:

* Error Rate (per-min)
* Proxy Status
* Request Rate (per-min)
* Active Servers
* Sessions Active
* Sessions Queued

### Requirements

The Haproxy monitoring Plugin for New Relic requires the following:

* A New Relic account. Signup for a free account at http://newrelic.com
* You need a host to install the plugin on that is able to poll the desired Haproxy server. That host also needs Ruby (tested with 1.8.7, 1.9.3), and support for rubygems.

### Instructions for running the Haproxy agent

1. Install this gem from RubyGems:

    `sudo gem install newrelic_haproxy_agent`

2. Install config, execute

    `sudo newrelic_haproxy_agent install` - it will create `/etc/newrelic/newrelic_haproxy_agent.yml` file for you.

3. Edit the `/etc/newrelic/newrelic_haproxy_agent.yml` file generated in step 2.

    3.1. replace `YOUR_LICENSE_KEY_HERE` with your New Relic license key. Your license key can be found under Account Settings at https://rpm.newrelic.com, see https://newrelic.com/docs/subscriptions/license-key for more help.

    3.2. add the URI of the haproxy CSV stats url

4. Execute

    `newrelic_haproxy_agent run`

5. Go back to the Plugins list and after a brief period you will see the Haproxy Plugin listed in your New Relic account


## Keep this process running

You can use services like these to manage this process and run it as a daemon.

- [Upstart](http://upstart.ubuntu.com/)
- [Systemd](http://www.freedesktop.org/wiki/Software/systemd/)
- [Runit](http://smarden.org/runit/)
- [Monit](http://mmonit.com/monit/)

Also you can use [foreman](https://github.com/ddollar/foreman) for daemonization.

Foreman can be useful if you want to use [Heroku](https://www.heroku.com/) for run your agent. Just add Procfile and push to Heroku.

`monitor_daemon: newrelic_haproxy_agent run -c config/newrelic_plugin.yml`

