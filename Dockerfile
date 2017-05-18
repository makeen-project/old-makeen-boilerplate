FROM mhart/alpine-node:7.5.0

ENV APP_USER=makeen \
	APP_ROOT=/makeen-app \
	NODE_ENV="development" \
	MAKEEN_LISTEN_PORT=3001 \
	APK_ADDPACK="git curl" \
	APK_RMPACK="git"

VOLUME /tmp \
	/var/cache/apk

RUN mkdir -p ${APP_ROOT} && \
	apk add --update ${APK_ADDPACK} && \
	addgroup -S ${APP_USER} && \
	adduser -S -g ${APP_USER} ${APP_USER} && \
	npm install -g modclean

ADD package.json /tmp/package.json

RUN cd /tmp && \
	npm install && \
	#modclean -r && \
	mv /tmp/node_modules ${APP_ROOT}/node_modules

ADD . ${APP_ROOT}

RUN cd ${APP_ROOT} && \
	npm run build && \
	node ./node_modules/lerna/bin/lerna.js bootstrap && \
	apk del ${APK_RMPACK}

EXPOSE ${MAKEEN_LISTEN_PORT}

HEALTHCHECK --interval=15s --timeout=5s --retries=3 CMD curl -f http://localhost:${MAKEEN_LISTEN_PORT}/documentation
WORKDIR ${APP_ROOT}
USER ${APP_USER}
ENTRYPOINT ["npm", "run"]
CMD ["start"]
