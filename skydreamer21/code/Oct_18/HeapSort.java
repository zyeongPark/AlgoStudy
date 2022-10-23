package Oct_18;

import java.io.*;
import java.util.StringTokenizer;

public class HeapSort {
    static final boolean MIN = true;
    static final boolean MAX = false;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;

        System.out.println("배열의 크기");
        System.out.print("-->  ");
        int N = Integer.parseInt(br.readLine());
        System.out.println("배열에 들어갈 숫자를 공백으로 구분해서 입력해주세요.");
        System.out.print("-->  ");
        st = new StringTokenizer(br.readLine());
        System.out.println("오름차순 정렬이라면 1, 내림차순 정렬이라면 2를 입력해주세요.");
        System.out.print("-->  ");
        int option = Integer.parseInt(br.readLine());
        int[] arr = new int[N+1];
        for (int i=1; i<=N; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        // true : 내림차순, false : 오름차순
        heapSort(arr, option == 2);

        System.out.println("heapSort의 결과");
        for (int i=1; i<=N ;i++) {
            System.out.printf("%d ",arr[i]);
        }
        System.out.println();

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void heapSort (int[] arr, boolean mode) {
        buildHeap(arr, mode);
        System.out.printf("%sheapify 후\n", mode ? "min" : "max");
        printArr(arr);
        System.out.println("\n정렬이 되어가는 과정");
        int size = arr.length;
        while (size > 1) {
            swap(arr, 1, size-1);
            size--;
            if (mode == true) minHeapify(arr, size, 1);
            else maxHeapify(arr, size,1);
            printArr(arr);
        }
    }

    public static void buildHeap(int[] arr, boolean mode) {
        int startIdx = ( arr.length - 1 ) / 2;
        for (int i = startIdx; i>=1; i--) {
            if (mode == MIN) minHeapify(arr, arr.length, i);
            else maxHeapify(arr, arr.length, i);
        }
    }

    // 자식 중 더 작은 자식이 부모보다도 작다면 교환합니다.
    public static void minHeapify(int[] arr, int size, int parent) {
        int maxIdx = size - 1;
        // 1. 자식노드가 없다면
        if ( parent*2 > maxIdx ) return;

        // 2. 자식노드가 1개라면
        int smallerChildNode = parent*2;

        // 3. 자식노드가 2개라면
        int rightChildIdx = parent*2 + 1;
        if ( rightChildIdx <= maxIdx && arr[rightChildIdx] < arr[smallerChildNode]) {
            smallerChildNode = rightChildIdx;
        }

        if (arr[smallerChildNode] < arr[parent]) {
            swap(arr, parent, smallerChildNode);
            minHeapify(arr, size, smallerChildNode);
        }
    }

    public static void maxHeapify(int[] arr, int size, int parent) {
        int maxIdx = size - 1;
        // 1. 자식노드가 없다면
        if ( parent*2 > maxIdx ) return;

        // 2. 자식노드가 1개라면
        int biggerChildNode = parent*2;

        // 3. 자식노드가 2개라면
        int rightChildIdx = parent*2 + 1;
        if ( rightChildIdx <= maxIdx && arr[rightChildIdx] > arr[biggerChildNode]) {
            biggerChildNode = rightChildIdx;
        }

        if (arr[biggerChildNode] > arr[parent]) {
            swap(arr, parent, biggerChildNode);
            maxHeapify(arr, size, biggerChildNode);
        }
    }

    public static void swap (int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    public static void printArr (int[] arr) {
        System.out.print("[DEBUG]  ");
        for (int i=1; i<arr.length; i++) {
            System.out.printf("%d ", arr[i]);
        }
        System.out.println();
    }
}
