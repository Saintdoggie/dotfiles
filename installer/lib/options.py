import sys
from lib.exec import execution
from termcolor import colored


class options:
    def handleCommandLineOptions():
        try:
            if (sys.argv[1] == "update"):
                        
                # system installation
                execution.install.system()

                # home installation
                execution.install.home()

                # config installation
                execution.install.configs()

                #cleans the system after update
                execution.install.clean()


                #warning message
                print(colored("Notice: ", "yellow"),"Some log files are stored in installer/output, please look through them for issues.")

            if (sys.argv[1] == "config"):
                execution.install.configs()

            if (sys.argv[1] == "clean"):
                execution.install.clean()

            if (sys.argv[1] == "help" or sys.argv[1] == "--help"):
                print("Usage:")
                print(" update  Updates the system")
                print(" config  Updates the configs")
                print(" clean   cleans system")
                print(" help    prints help message")




        except:
            print("Usage:")
            print(" update  Updates the system")
            print(" config  Updates the configs")
            print(" clean   cleans system")
            print(" help    prints help message")
