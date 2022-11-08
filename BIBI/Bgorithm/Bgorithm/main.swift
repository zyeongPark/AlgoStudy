//import Foundation

let testCase = Int(readLine()!)!

func dfs(_ x: Int, _ y: Int, _ map: inout [[Int]], _ m: Int, _ n: Int) {
    // 범위 밖이라면 종료
    if x < 0 || x >= n || y < 0 || y >= m || map[x][y] != 1 { return }
    
    map[x][y] = 0 // visit
    
    // 상하좌우 재귀 호출
    dfs(x+1, y, &map, m, n)
    dfs(x-1, y, &map, m, n)
    dfs(x, y+1, &map, m, n)
    dfs(x, y-1, &map, m, n)
}

for _ in 0 ..< testCase {
    let array = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (m, n, num) = (array[0], array[1], array[2]) // 맵 가로, 맵 세로, 배추 개수
    var map = Array(repeating: Array(repeating: 0, count: m), count: n)
    var count = 0
    
    // 배추 있는 자리 1
    for _ in 0 ..< num {
        let location = readLine()!.split(separator: " ").map{ Int(String($0))! }
        map[location[1]][location[0]] = 1
    }
    
    // 땅 전부 검사하면서 1있으면 dfs 돌리기
    for i in 0 ..< n {
        for j in 0..<m {
            if map[i][j] == 1 {
                count += 1
                dfs(i, j, &map, m, n)
            }
        }
    }
    print(count)
}
