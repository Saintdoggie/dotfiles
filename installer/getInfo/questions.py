import os

class questions:
    def update_or_install():
        #first question
        while (True):
            #print without a newline
            print("Would you like to install or update this system? (install/Upgrade)", end=" ")
            
            #uses a variable to check input with if statements
            inputs = input();

            #check if first character is I or i
            try:
                if (inputs[0] == "I" or inputs[0] == "i"):
                    os.system("echo 'keepGoing = true' > installer/data")
                    break
                
                #check if first character is U or u
                elif (inputs[0] == "U" or inputs[0] == "u"):
                    os.system("echo 'keepGoing = false' > installer/data")
                    break
                    
                #if user types something random, this will ask again
                else:
                    print("Please answer with Install or Upgrade")

            #if user didn't type anything this except block will catch it, then print
            except:
                print("Please answer with Install or Upgrade")

    def xorg_or_wayland():
        #second question
        while (True):
            
            #print without a newline
            print("Would you like to use Wayland or Xorg (Wayland/xorg)", end=" ")
            
            #uses a variable to check with if statements
            inputs = input();
            try:
                #check if first character is I or i
                if (inputs[0] == "W" or inputs[0] == "w"):
                    os.system("echo 'display = \"wayland\"' >> installer/data")
                    break

                #check if first character is U or u
                elif (inputs[0] == "X" or inputs[0] == "x"):
                    os.system("echo 'display = \"xorg\"' >> installer/data")
                    break

                #if none of those are try, print a statement saying do it again
                else:
                    print("Please answer with Xorg or Wayland")

            #if user didn't type anything this except block will catch it, then print
            except:
                print("Please answer with Xorg or Wayland")
    

    def dev():
        #second question
        while (True):
            
            #print without a newline
            print("Would you like to install some development programs (Y/n)", end=" ")
            
            #uses a variable to check with if statements
            inputs = input();
            try:
                #check if first character is I or i
                if (inputs[0] == "Y" or inputs[0] == "y"):
                    os.system("echo 'dev = \"true\"' >> installer/data")
                    break

                #check if first character is U or u
                elif (inputs[0] == "N" or inputs[0] == "n"):
                    os.system("echo 'dev = \"false\"' >> installer/data")
                    break

                #if none of those are try, print a statement saying do it again
                else:
                    os.system("echo 'dev = \"true\"' >> installer/data")
                    break

            #if user didn't type anything this except block will catch it, then print
            except:
                os.system("echo 'dev = \"true\"' >> installer/data")
                break
                