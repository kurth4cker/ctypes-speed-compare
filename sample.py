import ctypes
import time
import os 

mylibrary = ctypes.CDLL('libsum.so')

def topla():
    result = 0
    for i in range(100000000):
        result += 1
    return result

t1 = time.time()

print("C Sonuç:", mylibrary.squares_sum(ctypes.c_int()))

t2 = time.time()

print("Python Sonuç:", topla())

t3 = time.time()

print("C Süre:", t2 - t1)
print("Python Süre:", t3 - t2)
