##################################################################################
########## basically initializes the system to have all the basics ###############

# basic tools
apt-get update 
apt-get upgrade 
apt-get install build-essential 
apt-get install curl 
apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

# eases communication with postgres https://packages.debian.org/sid/libpq-dev
apt-get install libpq-dev

# install a javascript v8 runtime for rails to use with the asset pipeline http://packages.ubuntu.com/precise/libv8-dev
apt-get install libv8-dev





