#!/bin/bash

source ~/github/iconify/bash/bash-scripts/nextfinder.sh
source ~/github/iconify/bash/bash-scripts/git.sh

function vectoricons_staging() {
    ssh vectoricons-scott-stage@104.196.191.243 -p 2222
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

function num() {
    rename
}

# Create clean icon package folder structure
function icons_dir() {
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

# Run SVGO Node module on a folder of SVG fles
function svgit() {
    if [ -z "$1" ]; then
        echo "You must provide a folder name"
    else
        svgo -f $1 -o $1-svgo --pretty
    fi
}

# Rename all SVG files in a folder
function myrename() {
    thisdir=${PWD##*/}
    a=1
    for i in *.svg; do
      new=$(printf "${PWD##*/}-%04d.svg" "$a") #04 pad to length of 4
      mv -- "$i" "$new"
      let a=a+1
    done
}

# Recursively rename all SVG files in folders and subfolders
function renameall() {
    workdir=${PWD}
    for dir in $workdir/*;
    do
        cd $dir
        rename
        cd $workdir
    done
}

# Prefix all filenames in a folder
function prefixit() {
    if [ -z "$1" ]; then
        echo "You must provide a prefix"
    else
        for f in * ; do mv "$f" "$1-$f" ; done
    fi
}

# Get rid of Mac hidden files
function unmac {
  tr '\r' '\n' <$1 >$1.new;
  sudo rm -f $1;
  sudo mv $1.new $1
  for i in `find . -regex '.*\._.*'`; do sudo rm $i; echo "removing $i"; done
  sudo find . -name *.DS_Store -type f -exec rm {} \;
}

# Create a tarball of the current folder
function tarit() {
  date >/tmp/x
  sed 's/  / /g' /tmp/x>/tmp/y
  sed 's/:/./g' /tmp/y>/tmp/x
  sed 's/ /./g' /tmp/x>/tmp/y
  awk -F. '{print $8 "." $2 "." $3 "." $4 $5 $6}' /tmp/y>/tmp/x
  VERS=`cat /tmp/x`
  date > build.txt

  pwd >/tmp/x
  STR=`cat /tmp/x`
  FN=`awk -F\/ '{print NF}' /tmp/x`
  DIR=$(echo $STR | cut -f$FN -d"/")

  if [ -f $DIR.$VERS.tar ]; then
    sudo rm -f $DIR.$VERS.tar
  fi

  if [ -f $DIR.$VERS.tar.gz ]; then
    sudo rm -f $DIR.$VERS.tar.gz
  fi

  echo 'Beginning the tar ....'
  sudo nice tar -cf $DIR.$VERS.tar *
  ls -l $DIR.$VERS.tar
  echo 'Beginning the zipping ....'
  sudo nice gzip $DIR.$VERS.tar

  ls -l $DIR.$VERS.tar.gz

}

# Decompress a tarball
function untar() {
  tar -zxvf $1
}

# Get just the folder name of the current location
function dirname() {
  pwd  >/tmp/x
  STR=`cat /tmp/x`
  FN=`awk -F\/ '{print NF}' /tmp/x`
  DIR=$(echo $STR | cut -f$FN -d"/")
  echo $DIR
}

# Digitally sign a file
function sign {
  gpg -a -i -v --output $1.sig --detach-sign $1
}

# Use FreeBSD ZIP instead of Mac ZIP for portability
function myzip() {
    if [ [-n $1] || [$1 == "-h]" ]; then
        echo " "
        echo "Usage: "
        echo " "
        echo "  Create a ZIP archive of all files in a directory."
        echo " "
        echo " Arguments:"
        echo " "
        echo " 1 = The name of the archive to create."
        echo " "
        echo " Default:"
        echo " "
        echo " NONE"
        echo " "
        return
    elseif
    fi
   
  for i in `find . -regex '.*\._.*'`; do sudo rm $i; echo "removing $i"; done
  sudo find . -name *.DS_Store -type f -exec rm {} \; 
    zip -r /tmp/$1 *
    mv /tmp/$1 ~/Desktop
}

# Make a new strong password
#
# This function requires the `craic` binary written by George K. Flanagan
# If you are using Mac, you can use the function as-is. For Linux you will need 
# to change the body of the function to use the Linux words dictionary instead 
# of Mac's words dictionary:
#
#    /usr/local/bin/craic w9w9 -u -i /etc/linux.words -n 50 -m 12 > ~/Desktop/craic.txt
#
# The `w9w9` pattern tells craic the pattern to use for the password. This particuluar
# patters tells craic to create a password that is 'word-digit-word-digit'
# -n = number of passwords
# -m = password minimum length
function makepass()
{
  /usr/local/bin/craic w9w9 -u -i /usr/share/dict/words -n 50 -m 12 > ~/Desktop/craic.txt
}

# Create a version number from the current timestamp and POSIX path
function getversion()
{
  pwd > /tmp/x
  awk -F/ '{print $NF}' /tmp/x > /tmp/y
  mydir=`cat /tmp/y`
  date >/tmp/x
  sed 's/  / /g' /tmp/x>/tmp/y
  sed 's/:/./g' /tmp/y>/tmp/x
  sed 's/ /./g' /tmp/x>/tmp/y
  awk -F. '{print $8 "." $2 "." $3 "." $4 $5}' /tmp/y>/tmp/x
  mydate=`cat /tmp/x`
  VERSION=$mydir.$mydate
}

# Create a human-readable timestamp from the current date
function time_stamp {
  pwd > /tmp/x
  awk -F/ '{print $NF}' /tmp/x > /tmp/y
  mydir=`cat /tmp/y`
  date >/tmp/x
  sed 's/  / /g' /tmp/x>/tmp/y
  sed 's/:/./g' /tmp/y>/tmp/x
  sed 's/ /./g' /tmp/x>/tmp/y
  awk -F. '{print $8 "." $2 "." $3 "." $4 $5}' /tmp/y>/tmp/x
  mydate=`cat /tmp/x`
  TIME_STAMP=$mydate
}

# Same as above only prints to stdout
function print_version()
{
  pwd > /tmp/x
  awk -F/ '{print $NF}' /tmp/x > /tmp/y
  mydir=`cat /tmp/y`
  date >/tmp/x
  sed 's/  / /g' /tmp/x>/tmp/y
  sed 's/:/./g' /tmp/y>/tmp/x
  sed 's/ /./g' /tmp/x>/tmp/y
  awk -F. '{print $8 "." $2 "." $3 "." $4 $5}' /tmp/y>/tmp/x
  mydate=`cat /tmp/x`
  VERSION=$mydir.$mydate
  $VERSION > version.txt
}

BACKUPDIR=~/Documents/builds/

# Creates a backup of the current folder
function makebackup()
{
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
  echo "  Beginning the tar..."
  for i in `find . -regex '.*\._.*'`; do sudo rm $i; echo "removing $i"; done
  sudo find . -name *.DS_Store -type f -exec rm {} \;
  sudo tar -cf $TARBALL.tar *
  echo "  Gzipping the tarball..."
  sudo gzip $TARBALL.tar
  echo "  Moving $TARBALL.tar.gz to $BACKUPDIR..."
  sudo mv $TARBALL.tar.gz $BACKUPDIR
}

# Backup and delete current folder
function nuke()
{
  makebackup
  THISDIR=`pwd`
  echo "  Nuking $THISDIR..."
  sudo rm -R -f *
  echo "  Done."
}