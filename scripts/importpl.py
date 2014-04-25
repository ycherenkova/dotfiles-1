#!/usr/bin/python

############################################################
#USER CONFIGURATION: SET YOUR PATHS
win_path = 'D:\\Users\\Nicholas\\Music\\' #be sure to use double backslashes!
lin_path = '/home/chittle/Music/'
############################################################

import codecs
import csv
import sys
import os

file_in = sys.argv[1]
file_out = file_in + ".pls"

filename = file_in.split('/')[-1]
parts = filename.split('.')
if len(parts) > 1:
    pl_name = ".".join(parts[:-1])
else:
    pl_name = filename

f1 = codecs.open(file_in,'r','utf-16')

lines = []
for line in f1:
    lines.append(line.split('\t'))
f1.close()

f2 = codecs.open(file_out,'w','utf-8')

f2.write('[playlist]\n')
f2.write('X-GNOME-Title={0}\n'.format(pl_name))
f2.write('NumberOfEntries={0}\n'.format(len(lines)-1))

count = 0

for i,l in enumerate(lines[1:]):
    win_file = l[-1].strip()
    title = l[0].strip()

    lin_file = win_file.replace(win_path,lin_path)
    lin_file = lin_file.replace('\\','/')

    if os.path.exists(lin_file):
        count += 1
        try:
            lin_uri = 'file://{0}'.format(lin_file.replace(' ','%20'))
            #write it out
            f2.write('File{0}={1}\n'.format(count,lin_uri))
            f2.write('Title{0}={1}\n'.format(count,title))
        except:
            print "Couldn't write a file " + title

    else:
        print 'Could not find ' + lin_file
f2.close()

print "Wrote {0} songs".format(count)
