package Oct_17;

import java.util.ArrayList;

public class Heap<T extends Comparable<T>> {
    static final int ROOT = 1;

    private ArrayList<T> heap;
    private int lastIndex;

    public Heap() {
        this.heap = new ArrayList<>();
        this.lastIndex = 0;
        this.heap.add(null); // 첫번째 요소는 쓰지 않는다.
    }

    public void add(T elem) {
        this.heap.add(elem);
        this.lastIndex++;
        bubbleUP(lastIndex);
    }

    private void bubbleUP (int childIdx) {
        if (childIdx == ROOT) return;

        int parentIdx = childIdx / 2;
        // 부모의 우선순위가 더 높아야 한다.
        // if 문 안에 들어갈 statement는 자식의 우선순위가 더 높다면
        if (heap.get(childIdx).compareTo(heap.get(parentIdx)) < 0) {
            swap(parentIdx, childIdx);
            bubbleUP(parentIdx);
        }
    }

    public T delete() {
        if (lastIndex == 0) return null;
        swap(ROOT, lastIndex);
        T deletedElem = heap.get(lastIndex);
        heap.remove(lastIndex);
        lastIndex--;
        buubleDown(ROOT);
        return deletedElem;
    }

    private void buubleDown(int parentIdx) {
        int leftChildIdx = parentIdx*2;
        if (leftChildIdx > lastIndex) return;

        int priorChildIdx;

        if (leftChildIdx == lastIndex) {
            priorChildIdx = leftChildIdx;
        }
        else {
            int rightChildIdx = parentIdx*2 + 1;
            priorChildIdx = heap.get(leftChildIdx).compareTo(heap.get(rightChildIdx)) <= 0  ? leftChildIdx : rightChildIdx;
        }

        if (heap.get(priorChildIdx).compareTo(heap.get(parentIdx)) < 0) {
            swap(parentIdx, priorChildIdx);
            buubleDown(priorChildIdx);
        }
    }

    private void swap (int i, int j) {
        T temp = heap.get(i);
        heap.set(i, heap.get(j));
        heap.set(j, temp);
    }
}
