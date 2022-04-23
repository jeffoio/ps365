class Solution {
    // inorder 순회 후 k-1 인덱스
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        return sorted(root)[k-1]
    }

    func sorted(_ node: TreeNode?) -> [Int] {
        guard let node = node else { return []}

        return sorted(node.left) + [node.val] + sorted(node.right)
    }
}
