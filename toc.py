#!/usr/bin/env python3

import os
from sys import argv

if __name__ == "__main__":
    if len(argv) >= 2:
        for filename in argv[1:]:
            if os.path.isfile(filename):
                with open(filename) as file:
                    contents = file.readlines()
                    toc_idx = -1
                    for idx,line in enumerate(contents):
                        if "TOC" in line:
                            toc_idx = idx
                            break
                    if toc_idx != -1:
                        pass
                    else:
                        print("error: no 'TOC' marker found in file '" + filename + "'")
            else:
                print("error: file '" + filename + "' is not an existing regular file")
    else:
        print("error: supply a file to parse for a TOC")
        exit(1)
