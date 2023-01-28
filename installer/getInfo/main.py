import os

from getInfo.questions import *

class getInfo:

    def main():
        config = open("installer/data", "r")
        
        questions.update_or_install()
        if (config.readline() == "keepGoing = true\n"):
            questions.xorg_or_wayland()
            questions.dev()



class install:
    def laptop():
        os.system("make init")
        os.system("make install")

    def desktop():
        os.system("make install")


