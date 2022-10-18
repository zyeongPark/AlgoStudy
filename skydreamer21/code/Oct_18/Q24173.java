package Oct_18;

import java.io.*;
import java.util.StringTokenizer;
import java.util.Arrays;

public class Q24173 {
    static int N, K;
    static int[] answer = new int[2];
    static int numOfSwap = 0;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;

        st = new StringTokenizer(br.readLine());
        N = Integer.parseInt(st.nextToken());
        K = Integer.parseInt(st.nextToken());
        st = new StringTokenizer(br.readLine());
        int[] arr = new int[N+1];
        for (int i=1; i<=N; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        heapSort(arr);

//        System.out.printf("numOfSwap : %d\n",numOfSwap);
        if (numOfSwap < K) sb.append("-1");
        else {
            Arrays.sort(answer);
            sb.append(answer[0]).append(" ").append(answer[1]);
        }

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void heapSort (int[] arr) {
        heapify(arr);
        int size = arr.length;
        while (size > 2) {
            numOfSwap++;
            if (numOfSwap == K) {
                answer = new int[] {arr[1], arr[size-1]};
            }
            swap(arr, 1, size-1);
            size--;
            minHeapifyRecursion(arr, size, 1);
        }
    }

    public static void heapify(int[] arr) {
        int startIdx = ( arr.length - 1 ) / 2;
        for (int i = startIdx; i>=1; i--) {
            minHeapifyRecursion(arr, arr.length, i);
        }
    }

    // 자식 중 더 작은 자식이 부모보다도 작다면 교환합니다.
    public static void minHeapifyRecursion (int[] arr, int size, int parent) {
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
            numOfSwap++;
            if (numOfSwap == K) {
                answer = new int[] {arr[smallerChildNode], arr[parent]};
                return;
            }
            swap(arr, parent, smallerChildNode);
            minHeapifyRecursion(arr, size, smallerChildNode);
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