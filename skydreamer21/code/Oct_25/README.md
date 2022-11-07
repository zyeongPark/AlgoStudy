# Quick Sort

## 시간복잡도
- Best : $O(NlogN)$
  - 다른 $O(NlogN)$ 의 시간복잡도를 가지는 정렬보다도 더 빠르다.
  - 매 단계에서 적어도 1개의 원소가 자기 자리를 찾음
- Worst : $O(N^2)$
  - 이미 정렬된 것을 정렬하는 경우

- pivot에 영향을 많이 받기 때문에 pivot 설정이 중요하다.

## Inplace
- 배열을 담는 공간 이외에 추가 공간이 필요하지 않다
- Inplace : `True`

## 공간복잡도
- 평균 $O(logN)$
- 최악 $O(N)$

## Stable vs Unstable
- 중복된 원소들의 순서가 유지되지 않는다.
- Unstable

** stable sort 만들기
[Quicksort를 stable sorti*ng이 되게 하는 법](https://lemonlemon.tistory.com/145)
