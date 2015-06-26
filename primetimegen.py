#!/usr/bin/python3

from sys import argv 
from datetime import datetime

def is_prime(n, mode):
  if n <= 3:
    return n >= 2
  if n % 2 == 0:
    if mode == "v":
      print(str(n) + " is divisible by 2.")
    return False
  if n % 3 == 0:
    if mode == "v":
      print(str(n) + " is divisible by 3.");
    return False
  for i in range(5, int(n ** 0.5) + 1, 6):
    if n % i == 0:
      if mode == "v":
        print(str(n) + " is divisible by " + str(i))
      return False
    if n % (i + 2) == 0:
      if mode == "v":
        print(str(n) + " is divisible by " + str(i + 2))
      return False
  if mode == "v":
    print(str(n) + " is not divisible by any numbers!")
  return True

if len(argv) > 1:
  for num in argv[1:]:
    print("\033[92m" + num + " is prime." if is_prime(int(num), "v") else "\033[91m" + num + " is not prime.")
else:
  term_flag = False 
  time = datetime.now().time()
  curr_hour, curr_min = time.hour % 12, time.minute
  end_hour = curr_hour + 4;
  if(end_hour > 12):
    for num in range((curr_hour * 100) + curr_min, 1259):
      if num%100 <= 60:
        if is_prime(num, "n"):
          print("\033[92m" + str(int(num/100)) + ":" + (str(num%100) if num%100 > 10 else "0" + str(num%100)) + " is prime.") 
          term_flag = True
    for num in range(100, (end_hour * 100) + curr_min):
      if num%100 <= 60:
        if is_prime(num, "n"):
          print("\033[92m" + str(int(num/100)) + ":" + (str(num%100) if num%100 > 10 else "0" + str(num%100)) + " is prime.") 
          term_flag = True
  else:
    for num in range((curr_hour * 100) + curr_min, (end_hour * 100) + curr_min):
      if num%100 <= 60:
        if is_prime(num, "n"):
          print("\033[92m" + str(int(num/100)) + ":" + (str(num%100) if num%100 > 10 else "0" + str(num%100)) + " is prime.") 
          term_flag = True
  if not term_flag:
    "\033[91m No times for the next four hours are prime."

