#!/bin/bash

echo "Test datapath.dot"
../gvizparse.exe datapath.dot
dot -Tpng -O datapath.dot

echo "Test datapath_attrs.dot"
../gvizparse.exe datapath_attrs.dot
dot -Tpng -O datapath_attrs.dot
