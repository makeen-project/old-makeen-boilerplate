import { CRUDServiceContainer } from 'octobus-crud';
import schema from '../schemas/foo';

class ItemRepository extends CRUDServiceContainer {
  constructor({ store }) {
    super(store, schema);
  }
}

export default ItemRepository;
