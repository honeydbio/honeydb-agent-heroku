FROM debian:stretch-slim

# Install needed packages
RUN apt-get update && apt-get install -y curl debian-keyring debian-archive-keyring apt-transport-https nginx

# Install honeydb agent
RUN curl -1sLf 'https://dl.cloudsmith.io/public/honeydb/honeydb-agent/cfg/gpg/gpg.305CBD56E3FE07CA.key' | apt-key add -
RUN curl -1sLf 'https://dl.cloudsmith.io/public/honeydb/honeydb-agent/cfg/setup/config.deb.txt?codename=stretch&distro=debian' \
  	> /etc/apt/sources.list.d/honeydb-honeydb-agent.list \
	&& apt-get update \
	&& apt-get install honeydb-agent

# Copy configuration files
COPY configs/nginx.conf /etc/nginx/nginx.conf
COPY configs/agent.conf /etc/honeydb/agent.conf
COPY configs/services.conf /etc/honeydb/services.conf

# Copy script
COPY scripts/honeydb /usr/bin/honeydb

# Run the image as a non-root user
RUN useradd -ms /bin/bash honeydb
USER honeydb

# Run the honeydb-agent. CMD is required to run on Heroku
CMD ["honeydb"]
