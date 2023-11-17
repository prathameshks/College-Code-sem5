// optimal page replacement algorithm
// Input - array of size n required page index
// Output - string of n length with x for page fault and - for page hit

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
    int n;
    cout << "Enter the number of pages: ";
    cin >> n;
    vector<int> pages(n);
    cout << "Enter the page index: ";
    for (int i = 0; i < n; i++)
    {
        cin >> pages[i];
    }

    int m;
    cout << "Enter the number of frames: ";
    cin >> m;
    vector<int> frames(m, -1);
    int page_fault = 0;
    string page_fault_sequence = "";

    for (int i = 0; i < n; i++)
    {
        int j;
        for (j = 0; j < m; j++)
        {
            if (frames[j] == pages[i])
            {
                page_fault_sequence += '-';
                break;
            }
        }
        if (j == m)
        {
            int index = -1;
            int farthest = -1;
            for (int k = 0; k < m; k++)
            {
                int l;
                for (l = i + 1; l < n; l++)
                {
                    if (frames[k] == pages[l])
                    {
                        if (l > farthest)
                        {
                            farthest = l;
                            index = k;
                        }
                        break;
                    }
                }
                if (l == n)
                {
                    index = k;
                    break;
                }
            }
            frames[index] = pages[i];
            page_fault++;
            page_fault_sequence += 'x';
        }
    }

    cout << "Page Fault: " << page_fault << "\n";
    cout << "Page Fault Sequence: " << page_fault_sequence << "\n";
    return 0;
}



// Sample Input:
/*
20
1 2 3 4 1 2 5 1 2 3 4 5 1 2 3 4 5 2 3 4
3
*/