package Oct_21;

import java.io.*;
import java.util.StringTokenizer;

public class SelectionSort {
    static final int ASCENDING = 1;
    static final int DESCENDING = 2;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;

        // =================== get input ===================
        System.out.println("=========== Bubble Sort ===========\n");
        System.out.println("배열의 크기");
        System.out.print("-->  ");
        int N = Integer.parseInt(br.readLine());
        System.out.println("배열에 들어갈 숫자를 공백으로 구분해서 입력해주세요.");
        System.out.print("-->  ");
        st = new StringTokenizer(br.readLine());
        System.out.println("오름차순 정렬이라면 1, 내림차순 정렬이라면 2를 입력해주세요.");
        System.out.print("-->  ");
        int option = Integer.parseInt(br.readLine());

        // =================== main ===================
        int[] arr = new int[N];
        for (int i = 0; i < N; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        selectionSort(arr, option);
        System.out.println("\n정렬 결과");
        printArr(arr);

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void selectionSort (int[] arr, int option) {
        System.out.println("\n정렬이 되어가는 과정");
        int length = arr.length;
        for (int startIdx = 0; startIdx < arr.length - 1; startIdx++) {
            selection(arr, startIdx, option);
            printArr(arr);
        }
    }

    private static void selection (int[] arr, int startIdx, int option) {
        int value = option == ASCENDING ? Integer.MAX_VALUE : Integer.MIN_VALUE;
        int valueIdx = -1;
        for (int i = startIdx; i < arr.length; i++) {
            if (option == ASCENDING) {
                if (arr[i] < value) {
                    value = arr[i];
                    valueIdx = i;
                }
            }
            else {
                if (arr[i] > value) {
                    value = arr[i];
                    valueIdx = i;
                }
            }
        }
        swap(arr, startIdx, valueIdx);
    }

    private static void swap (int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    public static void printArr (int[] arr) {
        System.out.print("[DEBUG]  ");
        for (int i=0; i<arr.length; i++) {
            System.out.printf("%d ", arr[i]);
        }
        System.out.println();
    }
}
