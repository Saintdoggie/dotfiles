from termcolor import colored
from lib.exec import execution


def main():

    
    #system installation
    execution.install.system()

    #home installation
    execution.install.home()

    #config installation
    execution.install.configs()

    #warning message
    print(colored("Notice: ", "yellow"),"Some log files are stored in installer/output, please look through them for issues.")


main()
