#!/bin/sh

apt-get update -y
# apt-get upgrade -y

apt-get install language-pack-en && locale-gen

# Install dependencies
apt-get install -y --no-install-recommends \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

apt-get install -y \
    git
    python-virtualenv\
    python-dev\
    redis-server\
    libpq-dev

# install java 11 silently
echo "Installing java 11..."
sudo apt install openjdk-11-jdk -y

# install python 3 silently
echo "Installing python 3..."
sudo apt install python3 -y

# install Django 4 
echo "Installing Django 4..."
sudo apt install python3-pip -y
sudo pip3 install django

# install psycopg2 silently
echo "Installing psycopg2..."
sudo apt install python3-psycopg2 -y

# install postgresql silently
echo "Installing postgresql..."
sudo apt install postgresql -y

# install maven silently
echo "Installing maven..."
sudo apt install maven -y