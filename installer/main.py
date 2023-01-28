import os


from getInfo.main import *
from installer.main import *


def main():
    getInfo.main()
    installer.main()


#use a try function, so that you can do control + c to exit without an error
try:
    main()
except KeyboardInterrupt:
    print("\nExiting")