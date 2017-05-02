import { Plugin } from 'makeen-core';
import FooRepositoryService from './services/FooRepository';
import FooRouter from './routers/Foo';

class Foo extends Plugin {
  async boot(server) {
    const FooRepository = new FooRepositoryService({
      store: this.createStore({ collectionName: 'Foo' }),
    });

    const fooRouter = new FooRouter(FooRepository);

    this.createResource('Foo', {
      repository: FooRepository,
      router: fooRouter,
    });

    server.bind({
      FooRepository,
    });
  }
}

export const { register } = new Foo();
