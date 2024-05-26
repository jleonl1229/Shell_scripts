import os

def main():
    i, ii, iii, iv = 1, 1, 1, 1

    while (i < 256):
        ii = 1
        while (ii < 256):
            iii = 1
            while (iii < 256):
                iv = 1
                while (iv < 256):
                    print("IP: {}.{}.{}.{}".format(i, ii, iii, iv))
                    command = "nmap {}.{}.{}.{}".format(i, ii, iii, iv)
                    os.system(command)
                    iv += 1
                iii += 1
            ii += 1
        i += 1


if (__name__ == '__main__'):
    main()
