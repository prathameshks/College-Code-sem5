#include<iostream>
#include<vector>
#include<queue>
#include<algorithm>
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

bool compare(process a,process b){
    return a.at<b.at;
}

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
    sort(p.begin(),p.end(),compare);

    int time=0;
    for(int i=0;i<n;i++){
        if(time<p[i].at){
            time=p[i].at;
        }
        time+=p[i].bt;
        p[i].ct=time;
        p[i].tat=p[i].ct-p[i].at;
        p[i].wt=p[i].tat-p[i].bt;
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