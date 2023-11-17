1. **First-Come, First-Served (FCFS)**:
```cpp
sort(process_list, arrival_time)
for each process in the sorted process list:
    if arrival_time[current_process] > system_time:
        system_time = arrival_time[current_process]
    waiting_time = system_time - arrival_time[current_process]
    turnaround_time = waiting_time + burst_time[current_process]
    system_time += burst_time[current_process]
```

2. **Shortest Job First (SJF) - Preemptive**:
```cpp
while process_list is not empty:
    select process with minimum burst_time from processes that have arrived
    if arrival_time[selected_process] > system_time:
        system_time = arrival_time[selected_process]
    waiting_time = system_time - arrival_time[selected_process]
    turnaround_time = waiting_time + burst_time[selected_process]
    system_time += burst_time[selected_process]
    remove selected_process from process_list
```

3. **Priority Scheduling - Non-Preemptive**:
```cpp
sort(process_list, arrival_time)
initialize an empty priority queue pq
set system_time to 0
set i to 0
while i < size of process_list or pq is not empty:
    while i < size of process_list and arrival_time[process_list[i]] <= system_time:
        add process_list[i] to pq
        increment i
    if pq is not empty:
        set current_process to the process with the highest priority from pq
        remove current_process from pq
        increment system_time by burst_time[current_process]
        completion_time[current_process] = system_time
        turnaround_time[current_process] = completion_time[current_process] - arrival_time[current_process]
        waiting_time[current_process] = turnaround_time[current_process] - burst_time[current_process]
    else:
        increment system_time
```

4. **Round Robin (RR) - Preemptive**:
```cpp
set time_quantum
while process_list is not empty:
    for each process in the process list:
        if arrival_time[current_process] > system_time:
            continue
        if burst_time[current_process] > time_quantum:
            burst_time[current_process] -= time_quantum
            system_time += time_quantum
        else:
            system_time += burst_time[current_process]
            waiting_time = system_time - arrival_time[current_process] - burst_time[current_process]
            turnaround_time = system_time - arrival_time[current_process]
            remove current_process from process_list
```