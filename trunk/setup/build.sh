#!/bin/sh

# Copyright 2014 The runit-for-lfs project
# https://code.google.com/p/runit-for-lfs/
# Authors: James Powell and Arther Radley

# This script is used to build the required components of lfs-for-runit.

pushd ..
gcc halt.c -o halt
gcc pause.c -o pause
gcc suspend -o suspend
popd
