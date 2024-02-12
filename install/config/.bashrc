# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

function s() {                                                                                                                               
  screen -RD                                                                                                                                
}                                                                                                                                            
																       
function sr() {                                                                                                                              
  screen -r $1                                                                                                                              
}                                                                                                                                            
																       
function sd() {                                                                                                                              
  screen -D $1                                                                                                                              
}                                                                                                                                            
																       
function S() {                                                                                                                               
  screen -S $1                                                                                                                             
}

function sba() {
  source $HOME/.bashrc
}

function mysqlalchemy() {
  mysql -h alchemy.cmqx6tpknayx.us-east-2.rds.amazonaws.com -P 3306 -u alchemyadmin -p alchemy
}

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
set -o vi

alias python=python2
