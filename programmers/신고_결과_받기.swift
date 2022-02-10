func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let reports = Array(Set(report))
    var dic = [String: [String]]()
    var answer = Array(repeating: 0, count: id_list.count)
    
    reports.forEach { info in
        let split = info.split(separator: " ").map{String($0)}
        let reporter = split[0], reported = split[1]
        let temp = dic[reported] ?? []
        dic[reported] = temp + [reporter]
    }
    
    for id in id_list {
        if dic[id]?.count ?? 0 < k {
            continue
        }
        
        dic[id]!.forEach { reporter in
            let index = id_list.firstIndex(of: reporter)!
            answer[index] += 1
        }
    }
    
    return answer
}