#!/usr/bin/env bash

# This shell script is a hacky way to scrape
# out the files produced by the hprotoc call
mkdir dummy
(
cd dummy
hprotoc -I../../ --proto_path=.... --haskell_out=. person.proto |& grep ".hs"
)
rm -rf dummy

