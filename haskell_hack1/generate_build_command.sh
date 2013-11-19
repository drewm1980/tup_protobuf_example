#!/usr/bin/env bash

# Get the (real) names of our targets into a text file
# Note, again we have to do more work to deal with the shadowed names...
echo -n "Person_main.hs" > targets.txt
for x in `find symlink_tree/Person/ -name "*.hs"`
do
	echo -n " " >> targets.txt
	echo -n `basename $x` >> targets.txt
done

echo ": ../person.proto |> hprotoc -I .. --proto_path =.. --haskell_out=symlink_tree person.proto |> `cat targets.txt`"

rm -f targets.txt

