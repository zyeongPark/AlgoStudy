let coord = readLine()!.map { $0 }

let x = Int(coord[0].asciiValue! - Character("a").asciiValue!)
let y = Int(String(coord[1]))! - 1

// 범위를 벗어나는지 확인
func isValidCoord(y: Int, x: Int) -> Bool {
    return 0..<8 ~= y && 0..<8 ~= x
}

let dy = [-2, -2, -1, -1, 1, 1, 2, 2]
let dx = [1, -1, 2, -2, 2, -2, 1, -1]

var answer = 0

for i in 0..<8 {
    let ny = y + dy[i]
    let nx = x + dx[i]
    
    if isValidCoord(y: ny, x: nx) {
        answer += 1
    }
}

print(answer)

