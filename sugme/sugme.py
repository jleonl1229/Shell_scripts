import random
import os

def main():
    ips = list(range(1, 255)) 
    i = random.choice(ips)
    ii = random.choice(ips)
    iii = random.choice(ips)
    iv = random.choice(ips)

    command = "nmap {}.{}.{}.{}".format(i, ii, iii, iv)
    os.system(command)
    finalip = "{}.{}.{}.{}".format(str(i), str(ii), str(iii), str(iv))
    print(finalip)
    question = input("Do you want to add this ip to your list?[yes/no]\n")
    if (question == "yes"):
        with open("randips.txt", 'a') as f:
            f.write(finalip + "\n")
    else:
        return

if (__name__ == '__main__'):
    main()
