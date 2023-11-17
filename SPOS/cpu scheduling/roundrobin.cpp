// round robin cpu scheduling algorithm (preemptive)
#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

struct process
{
    int pid;
    int at;
    int bt;
    int ct;
    int tat;
    int wt;
};

int main(){
    int n;
    cout<<"Enter the number of processes: ";
    cin>>n;
    vector<process> p(n);
    cout<<"Enter the arrival time and burst time of each process";
    for(int i=0;i<n;i++){
        cout<<"Process "<<i+1<<": ";
        cin>>p[i].at>>p[i].bt;
        p[i].pid=i+1;
    }

    int tq;
    cout<<"Enter the time quantum: ";
    cin>>tq;

    int time=0;
    int i=0;
    queue<process> q;
    while(i<n || !q.empty()){
        while(i<n && p[i].at<=time){
            q.push(p[i]);
            i++;
        }

        if(!q.empty()){
            process temp=q.front();
            q.pop();
            if(temp.bt>tq){
                temp.bt-=tq;
                time+=tq;
                q.push(temp);
            }
            else{
                time+=temp.bt;
                temp.bt=0;
                temp.ct=time;
                temp.tat=temp.ct-temp.at;
                temp.wt=temp.tat-temp.bt;
                cout<<"Process "<<temp.pid<<" completed\n";
            }
        }
        else{
            time++;
        }
    }

    cout<<"Process\tAT\tBT\tCT\tTAT\tWT\n";
    for(int i=0;i<n;i++){
        cout<<p[i].pid<<"\t"<<p[i].at<<"\t"<<p[i].bt<<"\t"<<p[i].ct<<"\t"<<p[i].tat<<"\t"<<p[i].wt<<"\n";
    }
    return 0;
}

/*
Sample Input:
5
0 3
6 1
2 2
4 4
1 5

*/
