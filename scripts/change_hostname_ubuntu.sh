sudo sed -i '1 i\'"127.0.0.1 $1" /etc/hosts
sudo sed -i "s/.*/$1/g" /etc/hostname
sudo hostname $1
sudo sed -i "s/127\.0\.0\.1 $HOSTNAME//g" /etc/hosts
exec $SHELL -l
source $HOME/.bash_profile
