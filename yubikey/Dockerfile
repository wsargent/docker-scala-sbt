FROM docker-scala-sbt:shell

####################################
# Install yubikey
# https://github.com/jessfraz/dockerfiles/blob/master/ykpersonalize/Dockerfile
#
RUN apt-get update && apt-get install -y \
	software-properties-common \
	--no-install-recommends && \
	add-apt-repository ppa:yubico/stable && \
	apt-get update && apt-get install -y \
	ca-certificates \
	curl \
	libjson0 \
	libusb-1.0-0 \
	libyubikey0 \
	pcscd \
	procps \
	usbutils \
	yubikey-personalization \
	yubico-piv-tool \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root/

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "ykpersonalize", "--help" ]