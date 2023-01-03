let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], k = input[2]
let data = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)[0...1]

let first = data.first!, second = data.last!
let count = (m / (k + 1)) * k + m % (k + 1)
let result = (count * first) + (m - count) * second

print(result)
