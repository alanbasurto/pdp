import os
from datetime import datetime

def main():
    filename="thefile.txt"
    filesize=os.path.getsize(filename)
    if filesize/1048576> 100:
        now = datetime.now()
        newfilename = filename.split(".")[0] + now.strftime("%d%m%Y-%H:%M:%S") + "."+filename.split(".")[1]
        os.rename(filename,newfilename)
        f = open(filename,"w+")
        f.close()
    print(filesize,"bytes")
    print(filesize/1048576,"mb")

if __name__ == "__main__":
    main()
