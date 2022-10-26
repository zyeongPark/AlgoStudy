package Oct_26;

import java.io.*;
import java.util.StringTokenizer;

public class CountingSort {
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
        countingSort(arr, option);
        System.out.println("\n정렬 결과");
        printArr(arr);

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void countingSort(int[] arr, int option) {
        // 1. 원소 값을 인덱스로 가지는 배열로 횟수 카운트
        int[] count = countValues(arr);

        // 2. 누적합
        if (option == ASCENDING) {
            convertToMinPrefixSum(count);
        }
        else { // option == DESCENDING
            convertToMaxPrefixSum(count);
        }


        // 3. 배열의 원소를 돌아가며 정렬
        int[] temp = new int[arr.length];
        System.arraycopy(arr, 0, temp, 0, arr.length);

        for (int num : temp) {
            int sortedIdx = --count[num];
            arr[sortedIdx] = num;
        }
    }

    public static int[] countValues(int[] arr) {
        // count 배열의 최대 인덱스는 arr 원소 중 최댓값

        int[] count = new int[findMaxValue(arr) + 1];

        for (int num : arr) {
            count[num]++;
        }

        return count;
    }

    private static int findMaxValue(int[] arr) {
        int max = arr[0];

        int len = arr.length;
        for (int i = 1; i < len; i++) {
            max = Math.max(max, arr[i]);
        }

        return max;
    }
    public static void convertToMinPrefixSum(int[] count) {
        int len = count.length;
        for ( int i = 1; i < len; i++ ) {
            count[i] += count[i-1];
        }
    }

    public static void convertToMaxPrefixSum(int[] count) {
        int len = count.length;
        for ( int i = len - 2; i >= 0 ; i-- ) {
            count[i] += count[i+1];
        }
    }

    private static void printArr (int[] arr) {
        System.out.print("[DEBUG]  ");
        for (int i=0; i<arr.length; i++) {
            System.out.printf("%d ", arr[i]);
        }
        System.out.println();
    }
}












