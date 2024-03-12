import Foundation

//print(findSumOfThree(numbers: numbers, requiredSum: 20))
//print(findSumOfThree(numbers: numbers, requiredSum: 21))
//let otherNumbers = [-25, -10, -7, -3, 2, 4, 8, 10]
//print(findSumOfThree(numbers: otherNumbers, requiredSum: -8))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: -25))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: 0))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: -42))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: 22))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: -7))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: -3))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: 2))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: 4))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: 8))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: 7))
//print(findSumOfThree(numbers: otherNumbers, requiredSum: -1))


/**
 This is a vertex used in a graph
 */
public class Vertex {
    public let value: String
    public var edges: [Vertex] = []
    public init(value: String, edges: [Vertex] = []) {
        self.value = value
        self.edges = edges
    }
    public func addEdge(e: Vertex) {
        edges.append(e)
    }
    public func addEdges(edges: [Vertex]) {
        for e in edges {
            self.edges.append(e)
        }
    }
}

var dict: [String: Vertex] = [:]
public func graphCloner(root: Vertex) -> Vertex? {
// check the set
    if dict.index(forKey: root.value) != nil {
        return dict[root.value]
    } else {
        var newEdges = [Vertex]()
        dict[root.value] = Vertex(value: "\(root.value)'", edges: [])
        for e in root.edges {
            if let edge = graphCloner(root: e) {
                newEdges.append(edge)
            }
        }
        dict[root.value]?.addEdges(edges: newEdges)
        return dict[root.value]
    }
}

var cloneSet: Set<String> = []
public func graphPrinter(root: Vertex) {
    if cloneSet.contains(root.value) {
        return
    } else {
        cloneSet.insert(root.value)
        let arr = root.edges.map { v in v.value }
        print("root value: \(root.value) with edges: \(arr)")
        for e in root.edges {
            graphPrinter(root: e)
        }
    }
}

/**
 This is a node used in trees and linked lists
 */
public class Node {
    public let value: Int
    public let rNode: Node?
    public let lNode: Node?
    
    public init(value: Int, lNode: Node? = nil, rNode: Node? = nil) {
        self.value = value
        self.lNode = lNode
        self.rNode = rNode
    }
}

public func flipTree(from root: Node) -> Node {
    var newRNode: Node?
    if let lNode = root.lNode {
        newRNode = flipTree(from: lNode)
    }
    var newLNode: Node?
    if let rNode = root.rNode {
        newLNode = flipTree(from: rNode)
    }
    return Node(value: root.value, lNode: newLNode, rNode: newRNode)
}

public func printTree(from root: Node) {
    var l = "nil"
    if let lNode = root.lNode {
        l = "\(lNode.value)"
        printTree(from: lNode)
    }
    var r = "nil"
    if let rNode = root.rNode {
        r = "\(rNode.value)"
        printTree(from: rNode)
    }
    print("Parent: \(root.value) Left: \(l) Right: \(r)")
}

public class ForLoops {
    
    let adjList: [[Int]] = [
        [0,0,0,0,0],
        [1,1,0,0,0],
        [1,1,0,1,1],
        [0,0,0,1,0],
    ]
    
    func depthFirstSearch(_ list:[[Int]]) -> [Int] {
        for row in adjList {
            for col in row {
                if col == 0 {
                    continue
                } else {
                    
                }
            }
        }
        
        return []
    }
    
}
