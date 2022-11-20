import Foundation

func solution(_ p:String) -> String {
    if p.isEmpty {
        return ""
    }
    if isValid(bracket: p) {
        return p
    }
    let w = split(bracket: p)
    var u = w.u
    let v = w.v
    
    if isValid(bracket: u) {
        return u + solution(v)
    } else {
        u.removeLast()
        u.removeFirst()
        return "(" + solution(v) + ")" + u.map { $0 == "(" ? ")" : "(" }.joined()
    }
}

func split(bracket: String) -> (u: String, v: String) {
    var leftCount = 0
    var rightCount = 0
    var u: [Character] = []
    var v: [Character] = []
    var isSameCount = false
    
    for b in bracket {
        if b == "(" {
            leftCount += 1
        } else {
            rightCount += 1
        }
        isSameCount ? v.append(b) : u.append(b)
        if leftCount == rightCount {
            isSameCount = true
        }
    }
    return (String(u), String(v))
}

func isValid(bracket: String) -> Bool {
    var stack: [Character] = []
    
    for b in bracket {
        if stack.isEmpty {
            stack.append(b)
            continue
        }
        
        if stack.last! == "(" && b == ")" {
            stack.removeLast()
            continue
        }
        stack.append(b)
    }
    
    return stack.isEmpty
}


