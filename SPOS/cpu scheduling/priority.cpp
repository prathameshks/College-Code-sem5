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
    int priority;
};

bool compareArrival(process a, process b)
{
    return a.at < b.at;
}

struct comparePriority
{
    bool operator()(process const& a, process const& b)
    {
        return a.priority > b.priority;
    }
};

int main()
{
    int n;
    cout << "Enter the number of processes: ";
    cin >> n;
    vector<process> p(n);
    cout << "Enter the arrival time, burst time and priority of each process\n";
    for (int i = 0; i < n; i++)
    {
        cout << "Process " << i + 1 << ": ";
        cin >> p[i].at >> p[i].bt >> p[i].priority;
        p[i].pid = i + 1;
    }

    sort(p.begin(), p.end(), compareArrival);

    priority_queue<process, vector<process>, comparePriority> pq;
    int time = 0;
    int i = 0;

    while (i < n || !pq.empty())
    {
        while (i < n && p[i].at <= time)
        {
            pq.push(p[i]);
            i++;
        }

        if (!pq.empty())
        {
            process current = pq.top();
            pq.pop();
            time += current.bt;
            current.ct = time;
            current.tat = current.ct - current.at;
            current.wt = current.tat - current.bt;

            cout << current.pid << "\t" << current.at << "\t" << current.bt << "\t" << current.ct << "\t" << current.tat << "\t" << current.wt << "\n";
        }
        else
        {
            time++;
        }
    }

    return 0;
}

// Sample Input:
/*
5
0 3 3
6 1 2
2 2 1
4 4 4
1 5 5

*/