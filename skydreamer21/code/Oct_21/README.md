# Selection Sort

## 시간복잡도
- Best : $O(N^2)$
- Worst : $O(N^2)$

## Inplace
- 배열을 담는 공간 이외에 추가 공간이 필요하지 않다
- Inplace : `True`

## 공간복잡도
- $O(n)$

## Stable vs Unstable
- 중복된 원소들의 순서가 바뀔 수 있다.
- unstable
- ex) 3 9 4 9' 1 => 1 3 4 9' 9
