package Oct_24;

import java.io.*;
import java.util.StringTokenizer;

public class InsertionSort {
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

        // =================== main ===================
        int[] arr = new int[N];
        for (int i = 0; i < N; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        insertionSort(arr, option);
        System.out.println("\n정렬 결과");
        printArr(arr);

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void insertionSort(int[] arr, int option) {
        System.out.println("\n정렬이 되어가는 과정");
        int length = arr.length;
        for (int startIdx = 1; startIdx < arr.length; startIdx++) {
            if (option == ASCENDING) {
                ascendingInsertion(arr, startIdx);
            }
            else { // option == DESCENDING
                descendingInsertion(arr, startIdx);
            }
            printArr(arr);
        }
    }

    private static void ascendingInsertion(int[] arr, int startIdx) {
        int idx = startIdx;
        while ( idx >= 1 &&  arr[idx-1] > arr[idx] ) {
            swap(arr, idx-1, idx);
            idx--;
        }
    }

    private static void descendingInsertion(int[] arr, int startIdx) {
        int idx = startIdx;
        while ( idx >= 1 &&  arr[idx-1] < arr[idx] ) {
            swap(arr, idx-1, idx);
            idx--;
        }
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
