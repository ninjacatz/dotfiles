#!/usr/bin/env python3
import os
import sys


def main():
    if len(sys.argv) == 2:
        recursiveSearch(sys.argv[1])
        print('\nDone!')
    else:
        print("Usage: qqjournal_attach.py /path/to/journal")


def recursiveSearch(directory):
    for file in os.listdir(directory):
        file_path = os.path.join(directory, file)

        if os.path.isdir(file_path):
            print('DIRECTORY: ' + file_path)
            recursiveSearch(file_path)
            print()
        elif '.md' not in file:
            file = '%20'.join(file.split(' '))
            md_attachment_line = '![ATTACHMENT: ](' + file + ')\n'
            md_path = os.path.dirname(file_path) + '/TXT.md'
            appendTxt(md_path, file, md_attachment_line)


def appendTxt(md_path, file, md_attachment_line):
    do_append = True
    with open(md_path, 'r', errors='ignore') as f:
        data = f.readlines()
        for line in data:
            if '](' + file + ')' in line:
                print('  already attached: ' + file)
                print(line)
                do_append = False

    if do_append:
        with open(md_path, 'a', errors='ignore') as f:
            print('----adding ' + file + ' to ' + os.path.dirname(md_path))
            f.write(md_attachment_line)


if __name__ == '__main__':
    main()
