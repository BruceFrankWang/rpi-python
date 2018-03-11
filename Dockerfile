# RPi-Python
# Docker image with Python 2.7.14 (and PIP 9.0.1) on brucefrankwang/rpi-alpine-cn:3.7

FROM arm32v6/alpine:3.7

LABEL maintainer="Bruce Frank Wang <bruce.frank.wang@gmail.com>"

ENV PYTHON_PIP_VERSION=9.0.1

RUN apk update && \
    apk add --no-cache \
        ca-certificates \
        openssl \
        python2 && \
    wget -c -nv -O get-pip.py "https://bootstrap.pypa.io/get-pip.py" && \
    python get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION" && \
	pip --version && \
	find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' + && \
	rm -f get-pip.py