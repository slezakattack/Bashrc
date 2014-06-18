# PRODDEPLOY: dest=/usr/local/imvu/prod_configs/buildbots/home/cit/.bashrc
# PRODDEPLOY: user=root
# PRODDEPLOY: group=root
# PRODDEPLOY: perm=444

umask 0002

alias cfagent="/bin/echo You probably meant to 'sudo cfagent' ... I will do that instead since you are in a sandbox ; sudo /usr/sbin/cfagent"
alias code_grep="grep -Inr --exclude-dir=./.svn "
alias clear_log="cat /dev/null > /var/log/php/php-apache-error.log"
alias where="find . -name "
PATH="$PATH:~/bin:~/.cabal/bin"

function merge() {
    cd ~/imvu/website-project/website
    s/pull
    svn merge -c -$1 .
    cd -
}

function remove_fail() {
    FILES=`find . -name "*.fail.html"`
    for FILE in $FILES
    do
        echo "Removing file..."$FILE
        rm $FILE
    done
}

function remove_swp() {
    FILES=`find . -name "*.swp"`
    for FILE in $FILES
    do
        echo "Removing file..."$FILE
        rm $FILE
    done
}

function oh_shit() {
    sudo /etc/init.d/apache2 restart
    sudo chmod 777 /var/log/php/php-apache-error.log
    cat /dev/null > /var/log/php/php-apache-error.log
}
