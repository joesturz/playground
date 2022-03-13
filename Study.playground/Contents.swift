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


//Strings

let testString: String = "This is a pretty good string with some stuff in it"
let length = testString.count

let splitString = testString.split(separator: " ")

let start = testString.index(testString.startIndex, offsetBy: 0)
let end = testString.index(testString.startIndex, offsetBy: testString.count - 1)
let segment = testString[start...end]

for c in testString {
    print(c)
}

for string in splitString {
    print(string)
}

checkForPalendrome(for: "kayak")
checkForPalendrome(for: "issi")
checkForPalendrome(for: "joe")

getAllPalendromes(for: "kayak mom")

let n6 = Node(value: 6)
let n5 = Node(value: 5)
let n4 = Node(value: 4)
let n3 = Node(value: 3)
let n2 = Node(value: 2, lNode: n5, rNode: n6)
let n1 = Node(value: 1, lNode: n3, rNode: n4)
let n0 = Node(value: 0, lNode: n1, rNode: n2)


let flippedRoot = flipTree(from: n0)
print("Original:")
printTree(from: n0)

print("Flipped:")
printTree(from: flippedRoot)

let intervalsA = [(1, 5), (3, 7), (4, 6), (6, 8)]
let intervalsB = [(10, 12), (12, 15)]

print(merge(intervals: intervalsA))
print(merge(intervals: intervalsB))

print(reverseWordOrder(of: "Hello World!"))
print(reverseWordOrder(of: testString))


let list = LinkedList(value: 1)
list.pushEnd(value: 2)
list.pushEnd(value: 3)
list.pushEnd(value: 4)
list.pushEnd(value: 5)

print(list.toString())
list.popFront()
print(list.toString())
list.popEnd()
print(list.toString())
print(list.peekFront()!.value)
print(list.toString())
print(list.peekEnd()!.value)
print(list.toString())
list.popEnd()
list.popEnd()
print(list.toString())
list.popEnd()
print(list.toString())
list.pushEnd(value: 1)
print(list.toString())
list.popEnd()
print(list.toString())
list.pushFront(value: 1)
print(list.toString())
print(list.isEmpty)
list.popFront()
print(list.toString())
print(list.isEmpty)
list.pushFront(value: 1)
list.popEnd()
print(list.toString())
print(list.isEmpty)


// concurrency examples
var matrix:[[Int]] = []
let toTen = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for i in toTen {
    var arr: [Int] = []
    for _ in (1...10) {
        arr.append(i)
    }
    matrix.append(arr)
}
DispatchQueue.concurrentPerform(iterations: 10) { i in
    Concurrency.combineRows(of: matrix, iteration: i) { i in
        print("for iteration \(i)")
    }
}


Concurrency.semaphoreExample()
