package Oct_27;

import java.io.*;
import java.util.StringTokenizer;

public class MergeSort {
    static final int ASCENDING = 1;
    static final int DESCENDING = 2;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;

        // =================== get input ===================
        System.out.println("=========== Merge Sort ===========\n");
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
        mergeSort(arr, option);
        System.out.println("\n정렬 결과");
        printArr(arr);

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void mergeSort(int[] arr, int option) {
        int len = arr.length;
        mergeSortRecursion (arr, 0, len - 1, option);
    }

    public static void mergeSortRecursion (int[] arr, int start, int end, int option) {
        if (start == end) return;

        int mid = (start + end) / 2;
        mergeSortRecursion(arr, start, mid, option);
        mergeSortRecursion(arr, mid + 1, end, option);
        if (option == ASCENDING) {
            minMerge(arr, start, mid, end);
        }
        else {
            maxMerge(arr, start, mid, end);
        }
    }

    public static void minMerge (int[] arr, int start, int mid, int end) {
        int len = end - start + 1;
        int[] temp = new int[len];
        int left = start;
        int right = mid + 1;
        int idx = 0;

        while (left <= mid && right <= end) {
            if (arr[left] <= arr[right]) {
                temp[idx] = arr[left];
                left++;
            }
            else { // arr[left] > arr[right]
                temp[idx] = arr[right];
                right++;
            }
            idx++;
        }

        while (left <= mid) {
            temp[idx++] = arr[left++];
        }

        while (right <= end) {
            temp[idx++] = arr[right++];
        }

        System.arraycopy(temp, 0, arr, start, len);
    }

    public static void maxMerge (int[] arr, int start, int mid, int end) {
        int len = end - start + 1;
        int[] temp = new int[len];
        int left = start;
        int right = mid + 1;
        int idx = 0;

        while (left <= mid && right <= end) {
            if (arr[left] >= arr[right]) {
                temp[idx] = arr[left];
                left++;
            }
            else { // arr[left] > arr[right]
                temp[idx] = arr[right];
                right++;
            }
            idx++;
        }

        while (left <= mid) {
            temp[idx++] = arr[left++];
        }

        while (right <= end) {
            temp[idx++] = arr[right++];
        }

        System.arraycopy(temp, 0, arr, start, len);
    }

    private static void printArr (int[] arr) {
        System.out.print("[DEBUG]  ");
        for (int i=0; i<arr.length; i++) {
            System.out.printf("%d ", arr[i]);
        }
        System.out.println();
    }
}












