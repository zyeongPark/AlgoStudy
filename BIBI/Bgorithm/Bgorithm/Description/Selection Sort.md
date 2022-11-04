# Selection Sort 특징
가장 작은 원소를 맨 앞에 배치해주는 것을 반복하는 방식의 정렬이다.

## 시간 복잡도
- 최선 : O(n^2)
- 평균 : O(n^2)
- 최악 : O(n^2)

## 공간 복잡도
- Inplace : True
- 공간복잡도 : O(n)

## Stable vs Unstable
정렬과정 중 중복된 원소가 있는 경우 그 위치가 유지되는지 아닌지 여부.
위치가 유지된다면 Stable, 유지되지 않는다면 Unstable
- SelectionSort는 동일한 값을 가지는 원소들의 본래 순서가 유지되기 때문에 Stable 하다
