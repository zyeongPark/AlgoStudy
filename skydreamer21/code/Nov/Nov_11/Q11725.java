// 11725번 트리의 부모 찾기
/*
<문제 정보>
 1. 루트없는 트리가 주어지고, 루트를 1이라 했을 때 각 노드의 부모를 구하는 프로그램

<변수 범위>
 1. 1초 / 256MB
 2. 노드의 개수 N 2<=N<=100,000

<프로그램 진행>
 1.

<필요 함수>
 1.

 */

// tree는 edge가 node-1개

import java.io.*;
import java.util.StringTokenizer;
import java.util.ArrayList;
import java.util.Deque;
import java.util.ArrayDeque;
import java.util.Arrays;

public class Q11725 {
    static int N;
    static Graph3 g;
    static int[] parentNode;


    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;
        N = Integer.parseInt(br.readLine());
        g = new Graph3(N);
        parentNode = new int[N+1];
        int v1, v2;
        for (int i=1;i<N;i++) {
            st = new StringTokenizer(br.readLine());
            v1 = Integer.parseInt(st.nextToken());
            v2 = Integer.parseInt(st.nextToken());
            g.addEdge(v1,v2);
        }
        bfs();
        for (int i=2;i<=N;i++) sb.append(parentNode[i]).append("\n");

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }

    public static void bfs() {
        Deque<Integer> q = new ArrayDeque<>();
        q.add(1);
        parentNode[1] = 1;
        int now;

        while(!q.isEmpty()) {
            now = q.poll();
            //System.out.println(now);
            //g.visited[now]=true;
            for (int v : g.adjList[now]) {
                if(parentNode[v]==0){
                    parentNode[v]=now;
                    q.add(v);
                }
            }
            /*
            System.out.print("q status : ");
            printQueue(q);
            System.out.print("parentNode status : ");
            System.out.println(Arrays.toString(parentNode));
            System.out.println();
             */
        }
    }

    public static void printQueue(Deque<Integer> q) {
        int cnt=0;
        System.out.print("(");
        for (int i : q) {
            cnt++;
            if (cnt==q.size()) System.out.print(i);
            else System.out.printf("%d ",i);
        }
        System.out.println(")");
    }
}

// 무방향 그래프
class Graph3 {
    int size;
    ArrayList<Integer>[] adjList;

    public Graph3 (int size) {
        this.size = size;
        adjList = new ArrayList[size+1];
        for (int i=0;i<=size;i++) adjList[i] = new ArrayList<>();
    }

    public void addEdge (int v1, int v2) {
        adjList[v1].add(v2);
        adjList[v2].add(v1);
    }
}
















