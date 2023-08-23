import java.util.*;

class process {
    public String pid;
    public int arr_t;
    public int burst_t;

    public process() {
        pid = "";
        arr_t = 0;
        burst_t = 0;
    }

    public process(String pid, int arr_t, int burst_t) {
        this.pid = pid;
        this.arr_t = arr_t;
        this.burst_t = burst_t;
    }

}

class cpu_scheduling {
    public static void sort(int p_num, process list[]) {
        process temp = new process();

        for (int i = 0; i < p_num; i++) {
            for (int j = 0; j < p_num - i - 1; j++) {
                if (list[j].arr_t > list[j + 1].arr_t) {
                    temp = list[j];
                    list[j] = list[j + 1];
                    list[j + 1] = temp;
                }
            }
        }
    }

    public static void tablePrint(int numOfProc, process[] list) {
        System.out.println("+-------+-----+-----+");
        System.out.printf("| %-5s | %-3s | %-3s |", "PID", "AT", "BT");
        System.out.println(" ");
        System.out.println("+-------+-----+-----+");

        for (int i = 0; i < numOfProc; i++) {
            System.out.printf("| %-5s | %3d | %3d |", list[i].pid, list[i].arr_t, list[i].burst_t);
            System.out.println(" ");
        }
        System.out.println("+-------+-----+-----+");

    }

    public void outputTable(int n, process list[], int ct[], int tat[], int wt[], int rt[]) {
        System.out.println("+-------+-----+-----+-----+-----+-----+-----+");
        System.out.printf("| %-5s | %-3s | %-3s | %-3s | %-3s | %-3s | %-3s |", "PID", "AT", "BT", "CT", "TAT", "WT",
                "RT");
        System.out.println(" ");
        System.out.println("+-------+-----+-----+-----+-----+-----+-----+");

        for (int i = 0; i < n; i++) {
            System.out.printf("| %-5s | %3d | %3d | %3d | %3d | %3d | %3d |", list[i].pid, list[i].arr_t,
                    list[i].burst_t, ct[i], tat[i], wt[i], rt[i]);
            System.out.println(" ");
        }
        System.out.println("+-------+-----+-----+-----+-----+-----+-----+");
    }

    public void fcfs(int p_num, process list[]) {
        int ct[] = new int[p_num]; // time when task complete
        int tat[] = new int[p_num]; // time from arrival to completion
        int wt[] = new int[p_num]; // time before start and arrival
        int rt[] = new int[p_num]; // response time for starting

        int sumWT = 0;
        int sumTAT = 0;

        ct[0] = list[0].burst_t;
        tat[0] = ct[0] - list[0].arr_t;
        wt[0] = tat[0] - list[0].burst_t;
        rt[0] = tat[0] - list[0].burst_t;

        sumWT += wt[0];
        sumTAT += tat[0];

        for (int i = 1; i < p_num; i++) {
            ct[i] = ct[i - 1] + list[i].burst_t;
            tat[i] = ct[i] - list[i].arr_t;
            wt[i] = tat[i] - list[i].burst_t;
            rt[i] = tat[i] - list[i].burst_t;

            sumWT += wt[i];
            sumTAT += tat[i];
        }

        System.out.println("Output Table:");
        outputTable(p_num, list, ct, tat, wt, rt);

        System.out.println("Average Waiting Time: " + (float) sumWT / p_num);
        System.out.println("Average Turn Around Time: " + (float) sumTAT / p_num);

    }

    public static void main(String[] args) {
        System.out.print("Enter Number of Processes:");
        Scanner scan = new Scanner(System.in);

        int numOfProc = scan.nextInt();

        process list[] = new process[numOfProc];

        for (int i = 0; i < numOfProc; i++) {
            process temp = new process();
            System.out.print("Enter ID of process ");
            System.out.print(i + 1 + ":");
            temp.pid = scan.next().toString();
            System.out.println("Enter Arrival Time:");
            temp.arr_t = scan.nextInt();
            System.out.println("Enter Burst time: ");
            temp.burst_t = scan.nextInt();
            list[i] = temp;
        }

        cpu_scheduling obj = new cpu_scheduling();
        System.out.println("Input Table:");
        tablePrint(numOfProc, list);

        sort(numOfProc, list);

        System.out.println("Sorted Table:");
        tablePrint(numOfProc, list);

        obj.fcfs(numOfProc, list);

        scan.close();

    }
}
/*
 * 3 p1 6 55 p11 65 23 p2 3 3
 * 5 P1 2 2 P2 5 6 P3 0 4 P4 0 7 P5 7 4
 * 
 */