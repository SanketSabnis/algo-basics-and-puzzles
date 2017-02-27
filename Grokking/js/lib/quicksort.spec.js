import test from 'tape';
import quicksort from './quicksort';

test('quicksort', (assert) => {
  assert.looseEqual(
    quicksort([ 4, 5, 2, 8, 1 ]),
    [ 1, 2, 4, 5, 8 ]
  );
  assert.looseEqual(
    quicksort([ 4, 5, 5, 8, 4, 6, 4, 6, 5 ]),
    [ 4, 4, 4, 5, 5, 5, 6, 6, 8 ]
  );
  assert.looseEqual(
    quicksort([ 1, 2, 3, 4, 5 ]),
    [ 1, 2, 3, 4, 5 ]
  );
  assert.looseEqual(
    quicksort([ "tank", "nymera", "barb", "grumsh" ]),
    [ "barb", "grumsh", "nymera", "tank" ]
  );
});
