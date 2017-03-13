const findCheapest = (costs, processed) => {
  return Object
    .keys(costs)
    .reduce(
      ({ lowestCost, lowestNode }, node) => {
        const cost = costs[node];
        return !processed.includes(node) && cost < lowestCost ?
          { lowestCost: cost, lowestNode: node } :
          { lowestCost, lowestNode };
      },
      { lowestCost: Infinity }
    )
    .lowestNode;
};

const buildPath = (parents, start, end, path = [ end ]) => {
  return start === end ?
    path :
    buildPath(parents, start, parents[end], [ parents[end], ...path ]);
};

const dijkstra = (
  graph,
  start,
  end,
  processed = [ ],
  parents = Object
    .keys(graph[start])
    .reduce((parents, neighbor) => {
      parents[neighbor] = start;
      return parents;
    }, { }),
  costs = { [end]: Infinity, ...(graph[start]) }
) => {
  const node = findCheapest(costs, processed);
  // base condition
  if(!node) return buildPath(parents, start, end);
  const cost = costs[node];
  const neighbors = graph[node];
  const { nextParents, nextCosts } = Object
      .keys(neighbors)
      .reduce(({ nextParents, nextCosts }, neighbor) => {
        const newCost = cost + neighbors[neighbor];
        return newCost < (nextCosts[neighbor] || Infinity) ?
          {
            nextParents: { ...nextParents, [neighbor]: node },
            nextCosts: { ...nextCosts, [neighbor]: newCost }
          } :
          { nextParents, nextCosts };
      }, {
        nextParents: parents,
        nextCosts: costs
      });
  return dijkstra(
    graph,
    start,
    end,
    [ ...processed, node ],
    nextParents,
    nextCosts
  );
};

export default dijkstra;
