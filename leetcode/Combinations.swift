class Solution {
    var storage = [[Int]]()

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        combination(Array(1...n), k, 0, [])
        return storage
    }

    func combination(_ total: [Int],_ selectedCount: Int,_ index: Int,_ selected: [Int]) {
        if selectedCount == 0 {
            storage.append(selected)
            return
        }

        if index == total.count { return }

        let new = selected + [total[index]]
        combination(total, selectedCount-1, index+1, new) // current 선택
        combination(total, selectedCount, index+1, selected) // current 미선택
    }
}
