class Solution {
    // 재귀
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let node = root else { return false }
        
        if node.isLeaf, targetSum - node.val == 0 {
            return true
        }
        
        return hasPathSum(node.left, targetSum - node.val) || hasPathSum(node.right, targetSum-node.val)
    }
    
    // BFS
    func hasPathSum2(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        var nodes = [root]
        
        while !nodes.isEmpty {
            var nextLevel = [TreeNode]()
            
            for currentNode in nodes {
                if currentNode.isLeaf, currentNode.val == targetSum { return true }
                
                currentNode.left?.val += currentNode.val
                currentNode.right?.val += currentNode.val
                nextLevel += [currentNode.left, currentNode.right].compactMap({$0})
            }
            
            nodes = nextLevel
        }
        
        return false 
    }
}

extension TreeNode {
    var isLeaf: Bool { return self.left == nil && self.right == nil }
}