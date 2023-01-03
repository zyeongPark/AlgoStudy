
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cache = Array(repeating: "", count: cacheSize)
    var time = 0
    
    // 캐시 사이즈가 0이라면 모두 cache miss 이므로 5 * 배열길이 반환
    if cacheSize == 0 {
        return 5 * cities.count
    } else {
        // 캐시 사이즈가 0이 아니라면 LRU 실행
        cities.forEach { city in
            // 캐시에 해당 문자열이 있는 경우 = cache hit
            if cache.contains(city.lowercased()) {
                time += 1
                cache.remove(at: cache.firstIndex(of: city.lowercased())!)
            } else {
                // 캐시에 해당 문자열이 없는 경우 = cache miss
                time += 5
                cache.remove(at: cache.count - 1)
            }
            cache.insert(city.lowercased(), at: 0)
        }
    }
    
    return time
}
