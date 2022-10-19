# HeapSort 특징 정리

## 시간복잡도
정렬이 되어있으나 안되어 있으나 힙을 만들고 정렬하는 과정이 똑같이 들어간다.
- 최선 : $O(NlogN)$
- 최악 : $O(NlogN)$

## 공간복잡도
- Inplace : True
- 공간복잡도 $O(n)$

## Stable vs Unstable
정렬하는 원소 내에 중복된 원소가 있을 경우 그 위치가 유지 되나?
- HeapSort의 경우 정렬하는 과정에서 바뀔 수 있다.
- Unstable