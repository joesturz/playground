import Foundation

public class LinkedList {
    var head: Link?
    var tail: Link?
    
    public var count = 0
    
    public var isEmpty:Bool {
        get { return count == 0 }
    }
    
    public init(value: Int) {
        let head = Link(value: value, parent: nil, child: nil)
        self.head = head
        self.tail = head
        count += 1
    }
    
    public init() {
        self.head = nil
        self.tail = nil
        count = 0
    }
    
    public func pushFront(value: Int) {
        let link = Link(value: value, parent: nil, child: head)
        guard let head = self.head else {
            self.head = link
            self.tail = link
            count += 1
            return
        }
        head.setParent(parent: link)
        self.head = link
        count += 1
    }
    
    public func pushEnd(value: Int) {
        let link = Link(value: value, parent: tail, child: nil)
        guard let tail = self.tail else {
            self.head = link
            self.tail = link
            count += 1
            return
        }
        tail.setChild(child: link)
        self.tail = link
        count += 1
    }
    
    public func popFront() -> Link? {
        let link = self.head
        
        guard let head = self.head, let child = head.child else {
            emptyList()
            return nil
        }
        child.setParent(parent: nil)
        self.head = child
        count -= 1
        return link
    }

    public func popEnd() -> Link? {
        let link = self.tail
        guard let tail = self.tail, let parent = tail.parent else {
            emptyList()
            return nil
        }
        parent.setChild(child: nil)
        self.tail = parent
        count -= 1
        return link
    }
    
    public func peekFront() -> Link? {
        return head
    }
    
    public func peekEnd() -> Link? {
        return tail
    }
    
    public func toString() -> String {
        guard var current = self.head else {
            return "empty"
        }
        var string = "--> \(current.value)"
        var temp = count - 1
        while (temp > 0) {
            if let link = current.child {
                string = "\(string) --> \(link.value)"
                current = link
            }
            temp -= 1
        }
        
        return string
    }
    private func emptyList() {
        self.head = nil
        self.tail = nil
        self.count = 0
    }
    
}

public class Link: Equatable {

    
    private var _value: Int
    public var value: Int {
        get { return _value }
    }
    internal var parent: Link?
    internal var child: Link?
    
    public init(value: Int, parent: Link?, child: Link?) {
        self._value = value
        self.parent = parent
        self.child = child
    }
    
    public func setParent(parent: Link?) {
        self.parent = parent
    }
    
    public func setChild(child: Link?) {
        self.child = child
    }

    
    public static func == (lhs: Link, rhs: Link) -> Bool {
        return (lhs._value == rhs._value
                && lhs.parent == rhs.parent
                && lhs.child == rhs.child)
    }
}




//First attempt: fails do to large integers
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public func addTwoNumbersNew(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if let l1 = l1, let l2 = l2 {
        let val1 = getIntFrom(node: l1)
        let val2 = getIntFrom(node: l2)
        let val3 = val1 + val2
        return getNodeFrom(num: val3)
    }
    return nil
}

public func getIntFrom(node: ListNode, sum: Int = 0, depth: Int = 0) -> Int {
    let placeVal = Int(truncating: pow(10, depth) as NSNumber)
    var newSum = (node.val * placeVal) + sum
    while node.hasNext() {
        guard let node = node.next else {
            return newSum
        }
        
        return getIntFrom(node: node, sum: newSum, depth: depth + 1)
    }
    return newSum
}

public func getNodeFrom(num: Int) -> ListNode? {
    let rev = String("\(num)".reversed())
    var currentNode: ListNode? = nil
    var firstNode: ListNode? = nil
    for n in rev {
        let newNode = ListNode.init(n.wholeNumberValue ?? 0)
        if currentNode == nil {
            firstNode = newNode
        } else {
            currentNode?.next = newNode
        }
        currentNode = newNode
    }
    
    return firstNode
}

extension ListNode {
    public func hasNext() -> Bool { self.next != nil }
}

//this solution works! even for big ints
public class Solution {
    public init() { }
    var headNode: ListNode? = nil
    var currentNode: ListNode? = nil
    var carryOver = 0
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var nextNode1 = l1
        var nextNode2 = l2
        while nextNode1 != nil || nextNode2 != nil {
            let i = nextNode1?.val ?? 0
            let j = nextNode2?.val ?? 0
            
            let sum = i + j + carryOver
            
            var newSum = sum
            if sum > 9 {
                newSum = sum % 10
                carryOver = sum / 10
            } else {
                carryOver = 0
            }
            let node = ListNode.init(newSum)
            if headNode == nil {
                headNode = node
            } else {
                if let c = currentNode {
                    c.next = node
                }
            }
            currentNode = node
            nextNode1 = nextNode1?.next
            nextNode2 = nextNode2?.next

        }
        if carryOver > 0 {
            let lastNode = ListNode.init(carryOver)
            currentNode?.next = lastNode
        }
        return headNode
    }
}
