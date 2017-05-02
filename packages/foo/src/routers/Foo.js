/* eslint-disable class-methods-use-this */
import Joi from 'joi';
import { ObjectID as objectId } from 'mongodb';
import omit from 'lodash/omit';
import { route, MongoResourceRouter } from 'makeen-router';
import schema from '../schemas/foo';

class FooRouter extends MongoResourceRouter {
  constructor(FooRepository, config = {}) {
    super(FooRepository, {
      namespace: 'Foo',
      basePath: '/foo',
      entitySchema: omit(schema, [
        '_id',
        'accountId',
        'createdAt',
        'updatedAt',
      ]),
      ...config,
    });

    this.applyContext({
      generateContext: request => ({
        accountId: objectId(request.auth.credentials.accountId),
      }),
    });
  }

  @route.get({
    path: '/say/{name}',
    config: {
      validate: {
        params: {
          name: Joi.string().required(),
        },
      },
      description: 'Hello!',
    },
  })
  async sayHello(request) {
    return `Hello ${request.params.name}!`;
  }
}

export default FooRouter;
