//
//  성적 낮은 학생부터 출력.swift
//  Algorithm
//
//  Created by 박지영 on 2023/01/11.
//

import Foundation
////n 입력 받기
//let n = Int(readLine()!)!
//
////값 입력받기
//var array:[Int] = []
//for _ in 0..<n{
//    var input = Int(readLine()!)!
//    array.append(input)
//}
//
////결과 출력
//var result = array.sort(by:>)
//print(result)

import Foundation

let n = Int(readLine()!)!
var result:[String] = []

func countingSort(_ n: Int) -> String {
    //학생 정보 받기
    var dict:[String: Int] = [:]
    for _ in 0..<n{
        var input = readLine()!.split(separator: " ")
        let student = String(input[0])
        let grade = Int(input[1])
        dict[student] = grade
    }
    
    //점수 기준 정렬
    let sortedDict = dict.sorted {
        //점수가 같다면 학생 이름 순으로 정렬 후 반환
        if $0.1 == $1.1{
            return $0.0 > $1.0
        }
        //아니라면 점수가 낮은 순서대로 반환
        return $0.1 < $1.1 }
    //print(sortedDict)
    
    //정렬 된 순서대로 -->error
    for student in sortedDict{
        result.append(student.0)
        //print(student.0, terminator:" ")
    }
}


print(countingSort(n))
