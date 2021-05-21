# 큐 2
# https://www.acmicpc.net/problem/18258

import sys
from collections import deque

q = deque()
for _ in range(int(input())):
    command = sys.stdin.readline()
    if command == "pop\n":
        if len(q) == 0:
            print(-1)
        else:
            print(q.popleft())
    elif command == "size\n":
        print(len(q))
    elif command == "empty\n":
        if len(q) == 0:
            print(1)
        else:
            print(0)
    elif command == "front\n":
        if len(q) == 0:
            print(-1)
        else:
            print(q[0])
    elif command == "back\n":
        if len(q) == 0:
            print(-1)
        else:
            print(q[-1])
    else:
        q.append(int(command[5:-1]))
