package Oct_25;

import java.io.*;
import java.util.StringTokenizer;

public class QuickSort {
    static final int ASCENDING = 1;
    static final int DESCENDING = 2;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;

        // =================== get input ===================
        System.out.println("=========== Insertion Sort ===========\n");
        System.out.println("배열의 크기");
        System.out.print("-->  ");
        int N = Integer.parseInt(br.readLine());
        System.out.println("배열에 들어갈 숫자를 공백으로 구분해서 입력해주세요.");
        System.out.print("-->  ");
        st = new StringTokenizer(br.readLine());
        System.out.println("오름차순 정렬이라면 1, 내림차순 정렬이라면 2를 입력해주세요.");
        System.out.print("-->  ");
        int option = Integer.parseInt(br.readLine());

        int[] arr = new int[N];
        for (int i = 0; i < N; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        // =================== main ===================
        quickSort(arr, option);
        System.out.println("\n정렬 결과");
        printArr(arr);


        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void quickSort(int[] arr, int option) {
        quickSortRecursion(arr, option, 0, arr.length - 1);
    }

    public static void quickSortRecursion (int[] arr, int option, int start, int end) {
        if (start >= end) return;
        int pivotIdx = option == ASCENDING ? minPartition(arr, start, end) : maxPartition(arr, start, end);

        quickSortRecursion(arr, option, start, pivotIdx -1);
        quickSortRecursion(arr, option, pivotIdx+1, end);
    }

    public static int minPartition (int[] arr, int start, int end) {
        int pivot = arr[start];
        int left = start+1;
        int right = end;

        while (true) {
            while (arr[left] <= pivot && left < right) left++;
            if (left >= right) break;
            while (arr[right] > pivot && left < right) right--;
            if (left >= right) break;
            swap(arr, left, right);
        }

        int swapIdx = arr[left] <= pivot ? left : left - 1;
        swap(arr, start, swapIdx);
        return swapIdx;
    }

    public static int maxPartition (int[] arr, int start, int end) {
        int pivot = arr[start];
        int left = start+1;
        int right = end;

        while (true) {
            while (arr[left] >= pivot && left < right) left++;
            if (left >= right) break;
            while (arr[right] < pivot && left < right) right--;
            if (left >= right) break;
            swap(arr, left, right);
        }

        int swapIdx = arr[left] >= pivot ? left : left - 1;
        swap(arr, start, swapIdx);
        return swapIdx;
    }

    private static void swap (int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    private static void printArr (int[] arr) {
        System.out.print("[DEBUG]  ");
        for (int i=0; i<arr.length; i++) {
            System.out.printf("%d ", arr[i]);
        }
        System.out.println();
    }
}
