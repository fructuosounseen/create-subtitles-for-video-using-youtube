# -*- coding: UTF-8 -*-
import os
import pysrt
srtfiles = []
basedir = input("Введите путь до субтитров: ")

srtfiles = []
for dirpath, subdirs, files in os.walk(basedir):
    for x in files:
        if x.endswith(".srt"):
            srtfiles.append(os.path.join(dirpath, x))

def extract(foo):
    for i in foo:
        t = i.text.replace('\n', ' ')
        c = t.split(' ')
        for word in c:
            yield word
        i.text = []

for a in srtfiles:
    srt = pysrt.open(a, encoding='utf-8')
    m = ' '.join(list(extract(srt)))
    b = m.replace('. ', '.\n\n\n')
    f = open(os.path.join(a + '.txt'),'w')
    f.write(b)
    f.close()