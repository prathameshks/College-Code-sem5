// Next fit memory allocation algorithm in C++ input is array of block size and process size and output is process no. process size and block no.
#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int n;
    cout << "Enter the number of blocks: ";
    cin >> n;
    vector<int> block(n);
    cout << "Enter the size of each block: ";
    for (int i = 0; i < n; i++)
    {
        cin >> block[i];
    }

    int m;
    cout << "Enter the number of processes: ";
    cin >> m;
    vector<int> process(m);
    cout << "Enter the size of each process: ";
    for (int i = 0; i < m; i++)
    {
        cin >> process[i];
    }

    vector<int> allocation(m, -1);
    int j = 0;
    for (int i = 0; i < m; i++)
    {
        int count = 0;
        while (count < n)
        {
            if (block[j] >= process[i])
            {
                allocation[i] = j;
                block[j] -= process[i];
                break;
            }
            j = (j + 1) % n;
            count++;
        }
    }

    cout << "Process No.\tProcess Size\tBlock No.\n";
    for (int i = 0; i < m; i++)
    {
        cout << i + 1 << "\t\t" << process[i] << "\t\t";
        if (allocation[i] != -1)
        {
            cout << allocation[i] + 1 << "\n";
        }
        else
        {
            cout << "Not Allocated\n";
        }
    }

    return 0;
}

// Sample Input:
/*
5
100 500 200 300 600
4
212 417 112 426
*/