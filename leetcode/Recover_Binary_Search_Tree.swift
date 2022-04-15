class Solution {
    var mistakeSorted = [TreeNode]()

    func recoverTree(_ root: TreeNode?) {
        var sorted = [TreeNode]()

        inOrder(root)

        sorted = mistakeSorted.sorted { $0.val < $1.val }

        for index in 0..<sorted.count {
            if mistakeSorted[index].val != sorted[index].val {
                swap(&mistakeSorted[index].val, &sorted[index].val)
                break
            }
        }
    }

    func inOrder(_ node: TreeNode?) {
        guard let node = node else { return }

        inOrder(node.left)
        mistakeSorted.append(node)
        inOrder(node.right)
    }
}
