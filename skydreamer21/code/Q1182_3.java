// 1182번 부분수열의 합
/*
<문제 정보>
 1. 부분 수열중 원소의 합이 S가 되는 경우의 수를 출력

<변수 범위>
 1. 2초 / 256MB
 2. 1<=N<=20
 3. S는 절댓값이 1,000,000 이하인 정수
 4. 주어지는 정수의 절댓값 100,000 이하

<프로그램 진행>
 1.

<필요 함수>
 1.

 */


import java.io.*;
import java.util.StringTokenizer;


public class Q1182_3 {



    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st = new StringTokenizer(br.readLine());
        int N = Integer.parseInt(st.nextToken());
        int S = Integer.parseInt(st.nextToken());
        int[] arr= new int[N];
        st=new StringTokenizer(br.readLine());
        int[] dp = new int[4000001];
        boolean inRange;
        int db=0;
        int breakPoint=300;
        for (int i=0;i<N;i++) {
//            if(db++>breakPoint) break;
            arr[i] = Integer.parseInt(st.nextToken());
            System.out.printf("i:%d, arr[i]:%d IN\n",i,arr[i]);
            if (arr[i]>=0) {
                for (int j=4000000;j>=0;j--) {
                    if(dp[j]!=0) {
                        inRange=j+arr[i]>=0 && j+arr[i]<=4000000;
                        if(inRange) {
                            dp[j+arr[i]]+=dp[j];
                            System.out.printf("j:%d에서 %d 추가 -> %d 번째\n",j-2000000,j+arr[i]-2000000,dp[j+arr[i]]);
//                            if(db++>breakPoint) break;
                        }
                    }
                }
            }
            else{
                for (int j=0;j<=4000000;j++) {
                    if(dp[j]!=0) {
                        inRange=j+arr[i]>=0 && j+arr[i]<=4000000;
                        if(inRange) {
                            dp[j+arr[i]]+=dp[j];
                            System.out.printf("j:%d에서 %d 추가 -> %d 번째\n",j-2000000,j+arr[i]-2000000,dp[j+arr[i]]);
//                            if(db++>breakPoint) break;
                        }
                    }
                }
            }

            dp[arr[i]+2000000]++;
        }
        bw.write(String.valueOf(dp[S+2000000]));


        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }
}






























