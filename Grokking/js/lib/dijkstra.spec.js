import test from 'tape';
import dijkstra from './dijkstra';

test('dijkstra', (assert) => {
   const graphA = {
     start: { a: 6, b: 2 },
     a: { fin: 1 },
     b: { a: 3, fin: 5 },
     fin: { }
   };
  assert.looseEqual(
    dijkstra(graphA, 'start', 'fin'),
    ['start', 'b', 'a', 'fin']
  );

  const graphB = {
    a: { b: 5, c: 2 },
    b: { d: 4, e: 2 },
    c: { b: 8, e: 7 },
    d: { f: 3, e: 6 },
    e: { f: 2 },
    f: { }
  };
  assert.looseEqual(
    dijkstra(graphB, 'a', 'f'),
    ['a', 'b', 'e', 'f']
  );

  const graphC = {
    a: { b: 10 },
    b: { c: 20 },
    c: { d: 1, e: 30 },
    d: { b: 1 },
    e: { }
  };
  assert.looseEqual(
    dijkstra(graphC, 'a', 'e'),
    ['a', 'b', 'c', 'e']
  );
});
