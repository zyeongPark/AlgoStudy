# Heap 자료구조란 ?
### 완전 이진 트리로 이루어진 최대 힙(maxheap) or 최소 힙(minheap)이다.

- maxheap : 부모는 자식보다 **크거나 같다**
- minheap : 부모는 자식보다 **작거나 같다**

<p align="center">
  <img
    src="https://user-images.githubusercontent.com/108422901/196415520-20d66201-ee1b-44c1-8344-8ca8bb9b968e.png"
    width="33%"
  />
<img
    src="https://user-images.githubusercontent.com/108422901/196415531-5f6271c0-cefc-4e94-b362-54194af0da99.png"
    width="33%"
  />
</p>


#### 🟡 **참고사항**
BST와 달리 내 왼쪽 자식, 오른쪽 자식 간의 크기는 상관 없다.
오직 본인보다 자식이 크거나 같은지만 중요하다.

완전 이진 트리이기 때문에 모든 값은 무조건 왼쪽 자식 노드부터 차례차례 채워진다.
따라서 배열을 통해 구현하면 인덱스를 통해 노드간 관계를 파악할 수 있다.

<p align="center">
  <img
    src="https://user-images.githubusercontent.com/108422901/196645628-56865937-7753-43c3-8854-b0fb6decd66c.png"
    width="33%"
  /> <img
    src="https://user-images.githubusercontent.com/108422901/196645754-df9df9c4-0df2-4dfd-8128-5e051c92eff5.png"
    width="33%"
  /> <img
    src="https://user-images.githubusercontent.com/108422901/196645773-1ba570bc-f1ec-4001-ae38-1951681ad817.png"
    width="33%"
  />
</p>


- 부모 idx = 자식 idx / 2
- 왼쪽 자식 idx = 부모 idx * 2
- 오른쪽 자식 dix = (부모 idx * 2) + 1
