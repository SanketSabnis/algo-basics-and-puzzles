#!/usr/bin/python
import sys
import copy
import math

# Chapter 1
def binary_search(val, elements, start=0, end=0):
    if start > end:
        return None
    mid = (start + end)/ 2
    if val == elements[mid]:
        return (mid, val)
    if val < elements[mid]:
        return binary_search(val, elements, start, mid-1)
    else:
        return binary_search(val, elements, mid+1, end)

# Chapter 2
def selection_sort(init_elements):
    sorted_elements = []
    max_index = 0
    elements = copy.deepcopy(init_elements)
    while(len(elements)!= len(sorted_elements)):
        for index in range(len(elements)):
            if elements[index] >= elements[max_index]:
                max_index = index
        sorted_elements.append(elements[max_index])
        elements[max_index] = sys.maxint* -1
    return sorted_elements[::-1]

# Chapter 3
class Node():
    value = None
    left = None
    right =  None

    def __init__(self, val):
        self.value = val

    def __repr__(self):
        return str(self.value)

    def set_right(self, val):
        self.right = Node(val)

    def set_left(self, val):
        self.left = Node(val)

class Tree():
    root = None
    depth = None

    def __init__(self, val=1):
        self.root = Node(val)

    # Generate Random tree
    def populate(self, start=1, root_node=None, depth=3):
        if not root_node:
            root_node = self.root
            self.depth = depth

        if depth == 0:
            return 
        root_node.set_left(start+1)
        self.populate(start+1, root_node.left, depth-1)
        root_node.set_right(start+3)
        self.populate(start+3, root_node.right, depth-1)

    # Assumes Complete Binary Tree (this is hard!!)
    def display(self):
        nodes = self.bfs()
        total_depth = int(math.log(len(nodes)+1, 2))
        for index in range(len(nodes)):
            depth = int(math.log(index+1, 2))
            spaces = 4*(total_depth - depth-1)
            if (index+1)%(2**depth) ==0 or index == 0:
                print "%s%s"% (" "*spaces, nodes[index]),
            else:
                print "%s%s"% (" "*((total_depth - depth)*2), nodes[index]),

            if index +2 == 2**(depth+1):
                print

    # Breadth First Search
    def bfs(self, search_term=None):
        nodes = [self.root]
        traversed_nodes = []
        while nodes:
            node = nodes.pop(0)
            traversed_nodes.append(node)
            if search_term and search_term == node.value:
                return traversed_nodes, node
            if node.left:
                nodes.append(node.left)
            if node.right:
                nodes.append(node.right)
        if search_term:
            return traversed_nodes, None
        return traversed_nodes

    # Depth First Search
    def dfs(self, search_term=None, root=None, found=None):
        nodes = [self.root if not root else root]
        traversed_nodes = []
        while nodes:
            node = nodes.pop()
            if found:
                return [], found
            # Search Left Sub Tree
            if node.left:
                traversed, found = self.dfs(search_term, node.left, found)
                traversed_nodes.extend(traversed)
            # Check Current Node
            traversed_nodes.append(node)
            if search_term and node.value == search_term:
                found = node
                return traversed_nodes, node
            # Check Right Sub Tree
            if node.right and not found:
                traversed, found = self.dfs(search_term, node.right, found)
                traversed_nodes.extend(traversed)
        return traversed_nodes, found

# Chapter 4
def quicksort(elements):
    if len(elements) < 2:
        return elements
    pivot_pos = len(elements)/2
    pivot = elements[pivot_pos]
    left = []
    right = []
    for x in range(len(elements)):
        if elements[x] > pivot:
            right.append(elements[x])
        elif x!= pivot_pos:
            left.append(elements[x])
    return quicksort(left) + [pivot] + quicksort(right)

if __name__ == "__main__":
    elements = list(reversed([5, 4, 3, 2, 1, 0, -6, -7, -8, -8, 9]))
    print "\n\n============Array Search==================\n"
    print "Search Space:      %s" % elements
    print "Binary Search for: %s -> %s" % (-7, binary_search(-7, elements, 0, len(elements)))
    print "\n\n==========Tree Traversal/Search===========\n"
    tree = Tree(1)
    tree.populate()
    tree.display()
    print "\nBreadth First Search: ", tree.bfs(8)
    print "Depth First Search:   ", tree.dfs(8)
    elements = [x*x*x for x in elements]
    print "\n\n========Sorting===========================\n"
    print "Originial:      %s" % elements
    print "Selection Sort: %s" % selection_sort(elements)
    print "Quick Sort:     %s" % quicksort(elements)
