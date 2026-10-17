# Allocate memory 10 MiB at a time, printing progress (used to hit a cgroup memory limit).
import sys

target = int(sys.argv[1])
chunks = []
for i in range(1, target // 10 + 1):
    chunks.append(bytearray(10 * 1024 * 1024))
    print(f"allocated {i * 10} MiB", flush=True)
print("done: no limit was reached")
