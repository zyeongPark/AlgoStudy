
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cache = Array(repeating: "", count: cacheSize)
    var time = 0
    
    // 캐시 사이즈가 0이라면 모두 cache miss 이므로 5 * 배열길이 반환
    if cacheSize == 0 {
        return 5 * cities.count
    } else {
        cities.forEach { city in
            if cache.contains(city.lowercased()) {
                time += 1
                cache.remove(at: cache.firstIndex(of: city.lowercased())!)
            } else {
                time += 5
                cache.remove(at: cache.count - 1)
            }
            cache.insert(city.lowercased(), at: 0)
        }
    }
    
    return time
}

let cacheSize1 = 3
let cities1 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]

print(solution(cacheSize1, cities1)) // 50

let cacheSize4 = 5
let cities4 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]

print(solution(cacheSize4, cities4)) // 52
