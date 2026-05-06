#!/bin/sh

echo -e "\e[0;32m Install and Configure Perl-CPAN\Perl-CPAN-Modules \e[0m"
sleep 2
cd /usr/src
yum install -y perl-CPAN perl-YAML perl-CPAN-DistnameInfo perl-libwww-perl perl-DBI perl-DBD-MySQL perl-GD perl-Env perl-Term-ReadLine-Gnu perl-SelfLoader perl-open.noarch 
##CPM install (Symlnk user cpm path to root bin)
#curl -fsSL https://raw.githubusercontent.com/skaji/cpm/master/cpm > /usr/local/bin/cpm
#curl -fsSL https://raw.githubusercontent.com/skaji/cpm/master/cpm > /bin/cpm
#chmod +x /usr/local/bin/cpm
#chmod +x /bin/cpm
##setup cpm mirror (may be installed without mirrorS too)
#export PERL_CPANM_OPT="--mirror http://www.cpan.org/ --mirror-only"
##install cpm basic essential for all users globlly
#cpm install -g JSON::PP
#cpm install -g JSON::XS
#cpm install -g App::cpanminus
#cpm install -g App::cpm
#cpm install -g JSON::PP JSON::XS App::cpanminus App::cpm
#cpm install -g
#CPM install using mirror argument
#cpm install -g --mirror http://www.cpan.org JSON::PP JSON::XS App::cpanminus App::cpm
#cpm install -g --mirror http://www.cpan.org
##oneliner for CPM install
#curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | perl - install -g JSON::PP JSON::XS App::cpanminus App::cpm
#/usr/local/bin/cpm install -g
##oneliner for CPM install using mirror
curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | perl - install -g --mirror http://www.cpan.org JSON::PP JSON::XS App::cpanminus App::cpm
/usr/local/bin/cpm install -g --mirror http://www.cpan.org 
echo -e "\e[0;32m All cpan-modules installed and verified successfuly \e[0m"
sleep 2
