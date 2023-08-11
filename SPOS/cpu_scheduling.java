import java.sql.Struct;
import java.util.*;

class process {
    public String pid;
    public int at;
    public int bt;

    process(){

    }
}


class cpu_scheduling {
    public void sort(int p_num, String pid[], int at[], int bt[]) {
        String temp1;
        int temp2;        
        int temp3;

        for (int i = 0; i < p_num; i++) {
            for (int j = 0; j < p_num - i; j++) {
                if(at[j] > at[j+1]){
                    temp1 = pid[j+1];
                    temp2 = at[j+1];
                    temp3 = bt[j+1];

                    pid[j+1] = pid[j];
                    at[j+1] = at[j];
                    bt[j+1] = bt[j];

                    pid[j] = temp1; 
                    at[j] = temp2; 
                    bt[j] = temp3; 
                }
            }
        }
    }

    public void tablePrint(int numOfProc,String[] pid,int[] arrTime,int[] brustTime){
        System.out.println("Sort");
        sort(numOfProc,pid,arrTime,brustTime);

        System.out.printf("| %-5s | %-3s | %-3s |", "PID", "AT", "BT");
        System.out.println(" ");

        for (int i = 0; i < numOfProc; i++) {
            System.out.printf("| %-5s | %3d | %3d |", pid[i], arrTime[i], brustTime[i]);
            System.out.println(" ");
        }
        
    }

    public void fcfs(int p_num, String pid[], int at[], int bt[]) {
        System.out.println("Sort");
        sort(p_num,pid,at,bt);

        
    }

    public static void main(String[] args) {
        System.out.print("Enter Number of Processes:");
        Scanner scan = new Scanner(System.in);

        int numOfProc = scan.nextInt();

        String[] pid = new String[numOfProc];
        int[] arrTime = new int[numOfProc];
        int[] brustTime = new int[numOfProc];

        for (int i = 0; i < numOfProc; i++) {
            System.out.print("Enter ID of process ");
            System.out.print(i + 1 + ":");
            pid[i] = scan.next().toString();
            System.out.println("Enter Arrival Time:");
            arrTime[i] = scan.nextInt();
            System.out.println("Enter Burst time: ");
            brustTime[i] = scan.nextInt();
        }

        System.out.printf("| %-5s | %-3s | %-3s |", "PID", "AT", "BT");
        System.out.println(" ");

        for (int i = 0; i < numOfProc; i++) {
            System.out.printf("| %-5s | %3d | %3d |", pid[i], arrTime[i], brustTime[i]);
            System.out.println(" ");
        }
        

        scan.close();

    }
}
/*
 * 3 p1 6 55 p11 65 23 p2 3 3
 * 
 */