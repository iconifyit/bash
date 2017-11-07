#!/bin/bash

source ~/bash-scripts/nextfinder.sh

function quatro() {
    cd ~/github/iconify/quatro-icons/
}

function products() {
    cd ~/Dropbox/iconify-products/
}

function istock() {
    cd ~/Dropbox/iconify-products/collections/istock-sets/
}

function vectoricons_staging() {
    ssh vectoricons-scott-stage@104.196.191.243 -p 2222
}

function diversity() {
    cd ~/github/iconify/diversity-icons
}

function vectorme() {
    cd ~/github/iconify/vectoricons
}

function products() {
    cd ~/Dropbox/000-iconify-products/collections/
}

function webme() {
    cd ~/Documents/Websites/
}

function org() {
  mkdir 64px
  mkdir 128px
  mkdir 256px
  mkdir 512px
  mkdir 32px
  mkdir svg

  mv *@32* 32px/
  mv *@64* 64px/
  mv *@128* 128px/
  mv *@256* 256px/
  mv *@512* 512px/
  mv *.svg svg/
}

function www {
    cd /Library/WebServer/Documents/
}

function uploadall() {
  pwd > /tmp/x
  awk -F/ '{print $NF}' /tmp/x > /tmp/y
  mydir=`cat /tmp/y`
  date >/tmp/x
  sed 's/  / /g' /tmp/x>/tmp/y
  sed 's/:/./g' /tmp/y>/tmp/x
  sed 's/ /./g' /tmp/x>/tmp/y
  awk -F. '{print $8 "." $2 "." $3 "." $4 $5}' /tmp/y>/tmp/x
  mydate=`cat /tmp/x`
  TARBALL=$mydir.$mydate
  date > /tmp/version.txt
  sudo cp /tmp/version.txt .
  echo "  + Beginning the tar..."
  sudo tar -cf $TARBALL.tar *
  echo "  + Gzipping the tarball..."
  sudo gzip $TARBALL.tar
  echo "  + Starting the upload..."
  scp $TARBALL.tar.gz scott@isolde.digitalgaslight.com:~/.
  echo "  + Upload Complete."
  if [ $1 == "Y" ]; then
    echo "  + Connnecting to Isolde..."
    ssh scott@isolde.digitalgaslight.com
  fi
}

function rmtrash() {
  sudo rm -R -f ~/.Trash/*
}

function attach() {
    if [ $# -lt 1 ] ; then
        echo "    usage: $0 <the disk image file>"
        return
    fi
    if [ ! -f $1 ]; then
        echo "    Disk image <$1> was not found"
        return
    fi
    hdiutil attach $1
}

function detach() {
    if [ $# -lt 1 ] ; then
        echo "    usage: $0 <the volume to detach>"
        return
    fi
    hdiutil detach /Volumes/$1
}

function unmount() {
  diskutil unmount /Volumes/$1
}

function devup {
    dev
    killall -STOP "Google Drive"
    killall -STOP "Dropbox"
    vagrant up
}

function devdown {
    dev
    vagrant halt
    killall -CONT "Google Drive"
    killall -CONT "Dropbox"
}