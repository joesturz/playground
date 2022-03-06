import Foundation

public class LinkedList {
    var head: Link?
    var tail: Link?
    public var count = 0
    
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
            count -= 1
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
            count -= 1
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
