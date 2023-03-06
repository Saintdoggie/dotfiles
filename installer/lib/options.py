import sys
from lib.exec import execution
from termcolor import colored
import os

class options:
    def handleCommandLineOptions():
        
        
        didSomething = False
        
        try:
            for i, arg in enumerate(sys.argv):
 
                if (arg == "--update"):
                    execution.install.system()
                    execution.install.configs()
                    execution.install.home()
                    execution.install.restart()
                    execution.install.clean()
                    didSomething = True

                if (arg == "--config"):
                    execution.install.configs()
                    didSomething = True
                    
                if (arg == "--restart"):
                    execution.install.restart()
                    # os.exec("hyprctl dispatch exit")
                    # os.exec("sudo setsid sh -c 'exec Hyprland <> /dev/tty2 >&0 2>&1' ")


                    didSomething = True

                if (arg == "--system"):
                    execution.install.system()
                    didSomething = True

                if (arg == "--home"):
                    execution.install.home()
                    didSomething = True

                if (arg == "--clean"):
                    execution.install.clean()
                    didSomething = True


        except:
            print("error:")

        if (didSomething == False):
            print("Usage:")
            print(" --update  Updates the system")
            print(" --config  Updates the configs")
            print(" --clean   cleans system")
            print(" --help    prints help message")
            print(" --system  Updates system packages")
            print(" --home    Updates home packages")

