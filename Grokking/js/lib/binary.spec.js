import test from 'tape';
import binary from './binary';

test('binary', (assert) => {
  const list = [2, 4, 8, 16, 32, 64, 128, 256, 312];
  assert.equal(binary(list, 2), 0);
  assert.equal(binary(list, 32), 4);
  assert.equal(binary(list, 312), 8);
  assert.equal(binary(list, 0), null);
  assert.equal(binary(list, 66), null);
  assert.equal(binary(list, 666), null);
  assert.equal(binary(list, -1), null);
});
