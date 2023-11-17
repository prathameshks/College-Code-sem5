<!-- Pseudo Code of All 4 Algos -->
First Fit
```cpp
for each process in process_list:
    for each block in memory_blocks:
        if block is free and block size >= process size:
            allocate process to block
            break
```
Best Fit
```cpp
for each process in process_list:
    for each block in memory_blocks:
        if block is free and block size >= process size:
            if best_block is not set or block size < best_block size:
                set best_block to block
    if best_block is set:
        allocate process to best_block
        set best_block to NULL
```
Worst Fit
```cpp
for each process in process_list:
    for each block in memory_blocks:
        if block is free and block size >= process size:
            if worst_block is not set or block size > worst_block size:
                set worst_block to block
    if worst_block is set:
        allocate process to worst_block
        set worst_block to NULL
```
Next Fit
```cpp
set last_allocated_block to NULL
for each process in process_list:
    start = last_allocated_block or start of memory_blocks
    for each block in memory_blocks starting from 'start':
        if block is free and block size >= process size:
            allocate process to block
            set last_allocated_block to block
            break
    if process not allocated:
        for each block in memory_blocks from start to last_allocated_block:
            if block is free and block size >= process size:
                allocate process to block
                set last_allocated_block to block
                break