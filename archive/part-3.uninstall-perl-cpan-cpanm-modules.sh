#!/bin/sh

echo -e "\e[0;32m Uninstall and remove Perl-CPAN\Perl-CPAN-Modules \e[0m"
sleep 2
cd /usr/src
yum remove -y perl-CPAN perl-YAML perl-CPAN-DistnameInfo perl-libwww-perl perl-DBI perl-DBD-MySQL perl-GD perl-Env perl-Term-ReadLine-Gnu perl-SelfLoader perl-open.noarch 
##Get the current Perl version dynamically
perl_version=$(perl -V:version | awk -F= '{print $2}' | tr -d ' "')
cpm --clean
##Remove CPM executable
cpm_path=$(which cpm)
if [ -n "$cpm_path" ]; then
  rm -f "$cpm_path"
fi
##CPM complete uninstall remove
rm -f $(which cpm)
##Remove CPM-related cache and configuration
rm -rf ~/.perl-cpm
rm -rf ~/.cpanm
rm -rf ~/.cpan
#Remove the CPM executable from common installation locations
rm -rf /usr/local/bin/cpm
rm -rf /bin/cpm
# Remove Perl libraries from system-installed directories for the current Perl version
rm -rf /usr/local/lib/$perl_version/perl/*
rm -rf /usr/local/share/perl/$perl_version/*
##Remove CPM related Perl modules (dynamically for any version)
rm -rf /usr/local/share/perl5/$perl_version/App/cpm
rm -f /usr/local/share/perl5/$perl_version/App/cpm.pm
rm -f /usr/local/share/perl5/$perl_version/Module/cpmfile.pm
##Remove leftover modules installed during CPM
rm -f /usr/local/share/perl5/$perl_version/YAML/PP.pm
rm -f /usr/local/share/perl5/$perl_version/JSON/PP.pm
rm -f /usr/local/lib64/perl5/$perl_version/JSON/XS.pm
##Clean CPM related cache directory (optional but good)
rm -rf /root/.perl-cpm
##Check if CPM is truly gone
which cpm
perl -MApp::cpm -e1
echo -e "\e[0;32m All cpan-modules UninStalled and removed successfuly \e[0m"
sleep 2
