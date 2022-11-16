import Foundation

let s = "aabbaccc"
print("최종결과 : \(solution(s))") // 7

func solution(_ s:String) -> Int {
    var answer = s.count
    if answer < 3 { return answer }
    for length in 1...s.count/2 {
        let slicedString: [String] = sliceString(s, length)
        let compressedString: String = compressString(slicedString)
        let length = compressedString.count
        answer = length < answer ? length : answer
    }
    return answer
}

/// 문자열을 슬라이스하는 함수
/// - Parameters:
///   - str: 슬라이싱할 문자열
///   - len: 슬라이싱할 길이 단위
/// - Returns: 슬라이싱 된 단어 전체
func sliceString(_ str: String, _ len: Int) -> [String] {
    print()
    print(">> sliceString() 실행")
    var res = [String]()
    var tmp = ""
    
    for s in str {
        tmp += String(s)
        print("#0. s : \(s) ==> tmp += String(s)")
        print("#0. tmp : \(tmp)")
        print()
        if tmp.count >= len {
            res.append(tmp)
            print("#1. tmp.count : \(tmp.count)")
            print("#1. res : \(res)")
            print()
            tmp = ""
        }
    }
    
    if tmp != "" { res.append(tmp) }
    print("#3. tmp : \(tmp)")
    print("#3. res : \(res)")
    print()
    return res
    /// len = 1 이라면 res = ["a", "a", "b", "b", "a", "c", "c", "c"]
    /// len = 2 이라면 res = ["aa", "bb", "ac", "cc"]
}

/// 문자열을 압축하는 함수
/// - Parameter arr: 문자열로 압축하기 위한 String 형 배열
/// - Returns: 압축된 문자
func compressString(_ arr: [String]) -> String {
    print()
    print(">> compressString() 실행")
    var res: String = ""
    var tmp: String = ""
    var count: Int = 1
    
    for s in arr {
        print("#0. s : \(s) == tmp : \(s)")
        print("두 값이 동일하다면     => #1")
        print("두 값이 동일하지 않다면 => #2")
        print()
        if tmp == s { // 이전 문자와 동일하다면 + 1
            count += 1
            print("#1. count : \(count)")
            print()
        } else { // 이전 문자와 다르다면
            if tmp != "" { // 임시값이 존재할 경우
                res += (count > 1) ? "\(count)\(tmp)" : "\(tmp)" // count가 1이상일 때 압축
            }
            tmp = s // 현재 값을 임시로 설정
            count = 1 // 카운트 초기화
            print("#2. res : \(res)")
            print("#2. tmp : \(tmp)")
            print("#2. count : \(count)")
            print()
        }
    }
    
    if tmp != "" { // 맨 마지막 문자열 체크
        res += (count > 1) ? "\(count)\(tmp)" : "\(tmp)"
    }
    print("#3. tmp : \(tmp)")
    print("#3. res : \(res)")
    print()
    return res
}
