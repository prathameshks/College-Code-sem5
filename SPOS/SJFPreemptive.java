import java.util.*;

class Process {
    String pid;
    int arrivalTime;
    int burstTime;
    int remainingTime;
    int completionTime;
    int turnaroundTime;
    int waitingTime;

    public Process(String pid, int arrivalTime, int burstTime) {
        this.pid = pid;
        this.arrivalTime = arrivalTime;
        this.burstTime = burstTime;
        this.remainingTime = burstTime;
    }
}

class SJFPreemptive {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the number of processes: ");
        int n = sc.nextInt();

        Process[] processes = new Process[n];
        for (int i = 0; i < n; i++) {
            System.out.println("Enter details for process " + (i + 1) + ":");
            System.out.print("PID: ");
            String pid = sc.next();
            System.out.print("Arrival Time: ");
            int arrivalTime = sc.nextInt();
            System.out.print("Burst Time: ");
            int burstTime = sc.nextInt();
            processes[i] = new Process(pid, arrivalTime, burstTime);
        }

        sjfPreemptive(processes, n);

        sc.close();
    }

    public static void sjfPreemptive(Process[] processes, int n) {
        int time = 0;
        int completed = 0;
        boolean[] isCompleted = new boolean[n];
        while (completed < n) {
            int minBurstTime = Integer.MAX_VALUE;
            int minBurstTimeIndex = -1;
            for (int i = 0; i < n; i++) {
                if (!isCompleted[i] && processes[i].arrivalTime <= time && processes[i].remainingTime < minBurstTime) {
                    minBurstTime = processes[i].remainingTime;
                    minBurstTimeIndex = i;
                }
            }
            if (minBurstTimeIndex == -1) {
                time++;
                continue;
            }
            processes[minBurstTimeIndex].remainingTime--;
            time++;
            if (processes[minBurstTimeIndex].remainingTime == 0) {
                processes[minBurstTimeIndex].completionTime = time;
                processes[minBurstTimeIndex].turnaroundTime = processes[minBurstTimeIndex].completionTime
                        - processes[minBurstTimeIndex].arrivalTime;
                processes[minBurstTimeIndex].waitingTime = processes[minBurstTimeIndex].turnaroundTime
                        - processes[minBurstTimeIndex].burstTime;
                isCompleted[minBurstTimeIndex] = true;
                completed++;
            }
        }

        System.out.println("Output Table:");
        outputTable(processes);

        float avgWaitingTime = 0;
        float avgTurnaroundTime = 0;
        for (int i = 0; i < n; i++) {
            avgWaitingTime += processes[i].waitingTime;
            avgTurnaroundTime += processes[i].turnaroundTime;
        }
        avgWaitingTime /= n;
        avgTurnaroundTime /= n;

        System.out.println("Average Waiting Time: " + avgWaitingTime);
        System.out.println("Average Turnaround Time: " + avgTurnaroundTime);
    }

    public static void outputTable(Process[] processes) {
        System.out.println("+-------+-----+-----+-----+-----+-----+");
        System.out.println("| PID   | AT  | BT  | CT  | TAT | WT  |");
        System.out.println("+-------+-----+-----+-----+-----+-----+");
        for (int i = 0; i < processes.length; i++) {
            System.out.printf("| %-5s | %-3d | %-3d | %-3d | %-3d | %-3d |\n", processes[i].pid, processes[i].arrivalTime,
                    processes[i].burstTime, processes[i].completionTime, processes[i].turnaroundTime,
                    processes[i].waitingTime);
        }
        System.out.println("+-------+-----+-----+-----+-----+-----+");
    }
}


// 5 1 2 6 2 5 2 3 1 8 4 0 3 5 4 4 