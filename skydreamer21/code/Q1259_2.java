// 번
/*
<문제 정보>
 1.

<변수 범위>
 1.

<프로그램 진행>
 1.

<필요 함수>
 1.

 */

// StringBuilder 초기화 3가지 : 새로할당, delete(), setLength(0)

import java.io.*;

public class Q1259_2 {
    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringBuilder sbAns = new StringBuilder();
        String n;
        boolean isPalindrome;
        while(true) {
            n = br.readLine();
            if (n.equals("0")) break;
            isPalindrome = n.equals(sb.append(n).reverse().toString());
            sb.setLength(0);
            sbAns.append(isPalindrome ? "yes" : "no").append("\n");
        }
        bw.write(sbAns.toString());
        bw.flush();
        bw.close();
        br.close();
    }
}
