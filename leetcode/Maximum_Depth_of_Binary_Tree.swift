class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        var queue: [TreeNode] = [node]
        var depth = 0

        while !queue.isEmpty {
            var next: [TreeNode] = []

            queue.forEach { node in
                next += [node.left, node.right].compactMap({$0})
            }

            depth+=1
            queue = next
        }

        return depth
    }
}
