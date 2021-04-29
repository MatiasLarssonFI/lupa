#!/bin/bash

set -e

yui-compressor -o color-default.min.css color-default.css
yui-compressor -o layout.min.css layout.css
