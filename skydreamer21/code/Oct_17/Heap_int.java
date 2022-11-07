package Oct_17;

import java.util.ArrayList;

public class Heap_int {
    static final int ROOT = 1;

    private ArrayList<Integer> heap;
    private int lastIndex;

    public Heap_int() {
        this.heap = new ArrayList<>();
        this.lastIndex = 0;
        this.heap.add(0); // 첫번째 요소는 쓰지 않는다.
    }

    public void add(int elem) {
        this.heap.add(elem);
        this.lastIndex++;
        moveChild(lastIndex);
    }

    private void moveChild (int childIdx) {
        if (childIdx == ROOT) return;

        int parentIdx = childIdx / 2;
        // maxHeap이기 때문에 부모가 항상 더 크거나 같아야 합니다.
        if (heap.get(childIdx) > heap.get(parentIdx)) {
            swap(parentIdx, childIdx);
            moveChild(parentIdx);
        }
    }

    public void delete() {
        if (lastIndex == 0) return;
        swap(ROOT, lastIndex);
        heap.remove(lastIndex);
        lastIndex--;
        moveParent(ROOT);
    }

    private void moveParent (int parentIdx) {
        int leftChildIdx = parentIdx*2;
        if (leftChildIdx > lastIndex) return;

        int biggerValueChildIdx = leftChildIdx;

        int rightChildIdx = parentIdx*2 + 1;
        if (rightChildIdx <= lastIndex && heap.get(leftChildIdx) < heap.get(rightChildIdx)) {
            biggerValueChildIdx = rightChildIdx;
        }

        if (heap.get(parentIdx) < heap.get(biggerValueChildIdx)) {
            swap(parentIdx, biggerValueChildIdx);
            moveParent(biggerValueChildIdx);
        }
    }

    private void swap (int i, int j) {
        int temp = heap.get(i);
        heap.set(i, heap.get(j));
        heap.set(j, temp);
    }

    public void printHeap() {
        for (int i=1; i<=lastIndex; i++) {
            System.out.printf("%d ", heap.get(i));
        }
        System.out.println();
    }
}