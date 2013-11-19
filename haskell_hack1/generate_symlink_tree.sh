#!/usr/bin/env bash

# This is a hacky way of generating the tree of symlinks we need:
rm -f *.hs
rm -rf symlink_tree
mkdir -p symlink_tree
mkdir -p symlink_tree/Person

# An additional problem we have is that hprotoc generates two files named "Person.hs"
# HACK:  This file seems to come last in the list we generated...
# So use for the ~real files use basenames...
for x in `cat paths.txt | grep -v "\./Person.hs"`
do
	ln -s ../../`basename $x` symlink_tree/$x
done
# ... and for the ~actual file use a suffix.
ln -s ../Person_main.hs symlink_tree/Person.hs

