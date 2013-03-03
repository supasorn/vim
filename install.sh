#!/bin/bash
mkdir ~/.fonts
cd ~/.fonts
git clone https://gist.github.com/2324335
sudo fc-cache -vf
rm /tmp/Powerline.cache

