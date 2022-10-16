package Oct_17;

import java.io.*;

public class test {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();

//        Heap_int maxHeapInt = new Heap_int();
        Heap<Person> heap = new Heap<>();

        while (true) {
            System.out.println("\n[Option]");
            System.out.println("1. Add");
            System.out.println("2. Delete");
            System.out.println("3. Show Heap");
            System.out.println("4. Exit");
            System.out.print("->  ");
            int option = Integer.parseInt(br.readLine());
            if (option == 4) break;

            switch (option) {
                case 1:
                    System.out.println("Person 정보를 등록합니다.");
                    System.out.print("name : ");
                    String name = br.readLine();
                    System.out.print("name : ");
                    int number = Integer.parseInt(br.readLine());
                    System.out.print("height : ");
                    int height = Integer.parseInt(br.readLine());
                    heap.add(new Person(name, number, height));
                    break;
                case 2:
                    Person deleted = heap.delete();
                    System.out.printf("%s가 삭제 되었습니다.\n", deleted.name);
                    break;
                case 3:
//                    heap.printHeap();
            }
        }

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }
}

class Person implements Comparable<Person> {
    String name;
    int number;
    int height;

    public Person(String name, int number, int height) {
        this.name = name;
        this.number = number;
        this.height = height;
    }

    @Override
    public int compareTo (Person o) {
        return this.number == o.number ? this.height - o.height : this.number - o.number;
    }
}
