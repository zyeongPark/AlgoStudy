// 11724번 연결 요소의 개수
/*
<문제 정보>
 1. 연결요소의 개수 출력

<변수 범위>
 1. 3초 / 512MB
 2. 정점 개수 1<=N<=1,000
 3. 간선 개수 0<=M<=N(N-1)/2

<프로그램 진행>
 1.

<필요 함수>
 1.

 */

import java.io.*;
import java.util.StringTokenizer;

public class Q11724 {
    static int N;
    static int[] parent;

    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringTokenizer st = new StringTokenizer(br.readLine());
        N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());
        parent = new int[N+1];
        initSet();
        int a, b;
        while (M-->0) {
            st = new StringTokenizer(br.readLine());
            a = Integer.parseInt(st.nextToken());
            b = Integer.parseInt(st.nextToken());
            union(a,b);
        }

        int cnt=0;
        for (int i=1;i<=N;i++) {
            if(parent[i]==i) cnt++;
        }
        bw.write(String.valueOf(cnt));
        bw.flush();
        bw.close();
        br.close();
    }

    public static void initSet() {
        for (int i=1;i<=N;i++) parent[i]=i;
    }

    public static int find (int a) {
        if(parent[a]==a) return a;
        return parent[a]=find(parent[a]);
    }

    public static void union (int a, int b) {
        a = find(a);
        b = find(b);
        if(a==b) return;
        if(a<b) parent[b]=a;
        else parent[a]=b;
    }
}



















