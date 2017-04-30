FROM docker:17.03.0-ce

RUN apk --no-cache add git python py-pip jq && \
	pip install docker-compose==1.12.0

VOLUME /platform/build
VOLUME /platform/tars
