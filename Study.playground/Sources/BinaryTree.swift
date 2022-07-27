import Foundation


// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class BinaryTree {
    
    public func flatten(_ root: TreeNode?) {
        // if null return
        guard let root = root else { return }
        flatten(root.left)
        if root.left != nil {
            let temp = root.right
            root.right = root.left
            root.left = nil
            
            var temp2 = root.right
            while temp2?.right != nil {
                temp2 = temp2?.right
            }
            temp2?.right = temp
        }
        flatten(root.right)
    }
}

