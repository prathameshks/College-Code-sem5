<!-- Short pseudo code  for page replacement -->
LRU 
```cpp
for each page in page_list:
    if page is not in frame_list:
        if frame_list is full:
            remove the least recently used page from frame_list
        add page to frame_list
    else:
        move page to the end of frame_list
```

Optimal 
```cpp
for each page in page_list:
    if page is not in frame_list:
        if frame_list is full:
            look ahead in the page_list
            remove the page from frame_list that will not be used for the longest period of time
        add page to frame_list
```
