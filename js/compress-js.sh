#!/bin/bash

set -e

yui-compressor -o contact.min.js contact.js
yui-compressor -o videos.min.js videos.js
yui-compressor -o lupa.min.js lupa.js
yui-compressor -o work_list.min.js work_list.js
yui-compressor -o management_login.min.js management_login.js
