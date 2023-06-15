import os
from datetime import datetime

def main():
    filename="thefile.json"
    filesize=os.path.getsize(filename)
    if filesize/1000000> 10:
        now = datetime.now()
        newfilename = filename.split(".")[0] + now.strftime("%d%m%Y-%H:%M:%S") + ".json"
        os.rename(filename,newfilename)
        f = open(filename,"w+")
        f.close()
    print(filesize,"bytes")

if __name__ == "__main__":
    main()