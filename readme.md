Makeen Boilerplate
=======

The Makeen Boilerplate is a [Hapi.js](https://hapijs.com) server coupled with a few main Makeen plugins such as:
- [makeen-user](https://github.com/makeen-project/makeen/tree/develop/packages/makeen-user): used for providing user authentication and authorization
- [makeen-mailer](https://github.com/makeen-project/makeen/tree/develop/packages/makeen-mailer): used for sending email notofications on events like user signup and password reset
- [makeen-web](https://github.com/makeen-project/makeen/tree/develop/packages/makeen-web): used to act as a front-end React + Redux based boilerplate

The boilerplate acts as a starting point from where you can load and put to work existing makeen plugins. More on the makeen plugins can be found in the main [makeen monorepo](https://github.com/makeen-project/makeen).

------------

#### Requirements:
- Node v6 or higher
- mongodb connection

------------

#### Getting started:
- clone the project
- `npm install`

Environment variables that override default mongodb uri 127.0.0.1:
- MAKEEN_ENV_SERVER_CACHE_URI=mongodb://{ MONGO_URI }
- MAKEEN_ENV_REGISTRATIONS_1_PLUGIN_OPTIONS_MONGODB_HOST={ MONGO_HOST_NAME }

------------

#### Running the project in development mode:
- `$ npm start`
- if you want to run the web-app in development mode then you'll have to
```
$ cd ./packages/web-app
$ npm start
```

The following servers will be started:
- development server - http://localhost:3001
- client server - http://localhost:3004
- web-app server - http://localhost:3000

#### Running the project in production mode: