package Nov_8;

import java.io.*;
import java.util.*;

public class Q2606 {
    static Graph_adjList1 g;
    static int cnt=0;

    public static void main(String args[]) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringTokenizer st;
        int N = Integer.parseInt(br.readLine());
        int M = Integer.parseInt(br.readLine());
        g = new Graph_adjList1(N+1);
        int v1; int v2;
        while (M-- >0) {
            st = new StringTokenizer(br.readLine());
            v1 = Integer.parseInt(st.nextToken());
            v2 = Integer.parseInt(st.nextToken());
            g.addEdge(v1,v2);
        }
        bfs(1);
        bw.write(String.valueOf(cnt));
        bw.flush();
        bw.close();
        br.close();
    }

    public static void bfs(int start) {
        Deque<Integer> q = new ArrayDeque<>();
        q.add(start);
        g.visited[start] = true;
        int now;
        while(!q.isEmpty()) {
            now = q.poll();

            for (int next : g.adjList[now]) {
                if (!g.visited[next]) {
                    cnt++;
                    g.visited[next] = true;
                    q.add(next);
                }
            }
        }
    }
}

class Graph_adjList1 {
    public ArrayList<Integer>[] adjList;
    public boolean[] visited;

    public Graph_adjList1(int size) {
        adjList = new ArrayList[size + 1];
        visited = new boolean[size + 1];
        for (int i=0;i<=size;i++) adjList[i] = new ArrayList<>();
    }

    public void addEdge(int v1, int v2) {
        adjList[v1].add(v2);
        adjList[v2].add(v1);
    }
}