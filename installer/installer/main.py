import os

class installer:
    def main():
        config = open("installer/data", "r")
        
        #checks if the firstline has the variable keepGoing = true
        if (config.readline() == "keepGoing = false\n"):
            
            #assigning a variable to os.system shows it's return value, useful for output
            returnValue = os.system("make update")

            #shows error message if returnValue is not 0
            if (returnValue != 0):
                print("-" * 50)
                print("Failed to update system, please check logs.")
            
            #shows success message if returnValue is 1
            else:
                print("-" * 50)
                print("Succesfully updated System!")

        else:
            pass