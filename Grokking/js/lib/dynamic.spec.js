import test from 'tape';
import { knapsack, longestSubstring, longestSubsequence } from './dynamic';

test('knapsack', (assert) => {
  const valuables = [
    { item: 'guitar', value: 1500, weight: 1 },
    { item: 'stereo', value: 3000, weight: 4 },
    { item: 'laptop', value: 2000, weight: 3 }
  ];
  assert.deepEquals(
    knapsack(valuables, 4),
    {
      items: [
        { item: 'guitar', value: 1500, weight: 1 },
        { item: 'laptop', value: 2000, weight: 3 }
      ],
      value: 3500
    }
  );

  const moreValuables = [
    ...valuables,
    { item: 'iphone', value: 2000, weight: 1 }
  ];
  assert.deepEquals(
    knapsack(moreValuables, 4),
    {
      items: [
        { item: 'laptop', value: 2000, weight: 3 },
        { item: 'iphone', value: 2000, weight: 1 }
      ],
      value: 4000
    }
  );

  const itinerary = [
    { item: 'Westminster Abbey', value: 7, weight: 1 },
    { item: 'Globe Theater', value: 6, weight: 1 },
    { item: 'National Gallery', value: 9, weight: 2 },
    { item: 'British Museum', value: 9, weight: 4 },
    { item: 'St. Paul\'s Cathedral', value: 8, weight: 1 }
  ];
  assert.deepEquals(
    knapsack(itinerary, 4),
    {
      items: [
        { item: 'Westminster Abbey', value: 7, weight: 1 },
        { item: 'National Gallery', value: 9, weight: 2 },
        { item: 'St. Paul\'s Cathedral', value: 8, weight: 1 }
      ],
      value: 24
    }
  );
});

test('longestSubstring', (assert) => {
  const entry = 'hish';
  const options = [ 'fish', 'vista', 'hash', 'fist' ];
  assert.equals(longestSubstring(entry, options), 'fish');
});

test('longestSubsequence', (assert) => {
  const entry = 'hish';
  const options = [ 'vista', 'hash', 'fist' ];
  assert.equals(longestSubsequence(entry, options), 'hash');
});
