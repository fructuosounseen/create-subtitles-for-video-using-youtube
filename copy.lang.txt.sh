#!/bin/bash

find -maxdepth 1 -type f . -name *.lang.txt -exec cp {} "lang.txt" \;
