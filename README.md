# HoneyDB Agent for Heroku

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/honeydbio/honeydb-agent-heroku)

Deploy the HoneyDB Agent on Heroku quickly and easily by clicking the button above. This will deploy the HoneyDB Agent with its web plugin enabled.

## Steps to get started

1. Login to [HoneyDB](http://honeydb.io) to generate your HoneyDB API ID and HoneyDB API Key.
2. Click the Deploy to Heroku button above to begin the setup on Heroku.
3. Enter an App name.
4. Enter your **HONEYDB_API_ID** and **HONEYDB_API_KEY** values.
5. Click Deploy app.

That's it! Once the install completes you will be running a web honeypot in Heroku. Honeypot events will be sent to the HoneyDB web site. When you login to HoneyDB you can filter to see events from your honeydb agent(s).

## Luring bad actors and bots

Once your HoneyDB Agent is deployed, there are a few easy ways to lure traffic from potentiallly malicious sources.

### Register a top level domain

The first option is registering a top level domain and point it to your Heroku instance. Be creative with your domain names. For example, the following domains are available (as of this readme update):

* herokubank.com
* herokucryptoexchange.com

Note: You can configure a domain with your app Dyno by navigating Settings in the Heroku Dahsboard, also see [Heroku documenation](https://devcenter.heroku.com/articles/custom-domains).

### Create a sub-domain for an existing domain name

Another option is to create a sub-domain with one or more of your existing domain names. Some example sub-domains are:

* admin
* blog
* ftp
* webmail

![Add Domains](https://raw.githubusercontent.com/honeydbio/honeydb-agent-heroku/master/images/domains.png)

Note: You can configure a sub-domain with your app Dyno by navigating Settings in the Heroku Dahsboard, also see [Heroku documenation](https://devcenter.heroku.com/articles/custom-domains).

### Configure ProxyPass with an existing web server

If you have an exsiting web site and access to modify web server config, you can use ProxyPass. ProxyPass lets you define a path on your existing site, which maps back to yoour HoneyDB Agent Heroku instance. For example if a user navigated to `http://your-site.com/blog` that would be mapped to `http://your-heroku-dyno.herokuapps.com`.

For Apache HTTPD Server, see documentation on [ProxyPass Directive](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html#proxypass).

For NGINX, see documentation on [proxy_pass](http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass).

## Custom HTML content

Currently, the HoneyDB Agent HTTP plugin does not support custom content, :-(. However, keep an eye out for future versions, custom content is in the plans :-)
