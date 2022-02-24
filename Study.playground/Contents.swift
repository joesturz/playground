import UIKit

let numbers = [3, 7, 1, 2, 8, 4, 5]
func findSumOfThree(numbers: [Int], requiredSum: Int ) -> Bool {
    for (index_i, i) in numbers.enumerated() {
        for (index_j, j) in numbers.enumerated() {
            if index_i == index_j {
                continue
            }
            for (index_z, z) in numbers.enumerated() {
                if (index_i == index_z || index_j == index_z) {
                    continue
                }
                if i + j + z == requiredSum {
                    return true
                }
            }
        }
    }
    return false;
}

Vertex(value: "4", edges: [])

// create vertices
var v0 = Vertex(value: "0")
var v1 = Vertex(value: "1")
var v2 = Vertex(value: "2")
var v3 = Vertex(value: "3")
var v4 = Vertex(value: "4")

//add edges to vertices
v0.addEdges(edges: [v3, v4])
v1.addEdges(edges: [v2])
v2.addEdges(edges: [v0])
v3.addEdges(edges: [v2])
v4.addEdges(edges: [v0, v1, v3])

//printer(root: v0)
//printer(root: v1)
//printer(root: v0)

//func rec(_ i: Int){
//    print(i)
//    let j = i + 1
//    if i > 100 {
//        return
//    } else {
//        rec(j)
//    }
//}
//rec(1)

graphPrinter(root: v0)

if let v5 = graphCloner(root: v0) {
    graphPrinter(root: v5)
}
//v5.edges.count
//for e in v5.edges {
//    print(e.edges.count)
//}


