import Foundation

class LRUCache {
    var capacity: Int
    var cacheKey = [Int]()
    var cache = [Int: Int]()

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        guard let value = cache[key] else { return -1 }
        cacheKey = cacheKey.filter { $0 != key } + [key]
        return value
    }

    func put(_ key: Int, _ value: Int) {
         // 없는 경우
        if cache[key] != nil {
            cacheKey = cacheKey.filter { $0 != key } + [key]
            cache[key] = value

        } else {
            // update
            // capacity 체크
            if capacity <= cacheKey.count {
                cache[cacheKey.removeFirst()] = nil
            }
            cacheKey.append(key)
            cache[key] = value
        }
    }
}
