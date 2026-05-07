df -h
sleep 5

cd /usr/src/
yum clean all
rm -f ./*
rmdir ./debug
rmdir ./kernels
rmdir ./annobin
rm -rf ./archive
rm -rf ./firewalld
rm -rf ./usr-lib64-asterisk-modules
rm -rf ./etc-asterisk
rm -rf ./viciphone-etc-asterisk
rm -rf ./asterisk*
rm -rf ./dahdi*
rm -rf ./sipsak*
rm -rf ./lame*
rm -rf ./jansson*
rm -rf ./eaccelerator*
rm -rf ./libpri*
rm -rf ./libsrtp*

df -h
sleep 5

curl -Ls http://bit.ly/clean-centos-disk-space | sudo bash
find /var -name "*.log" \( \( -size +50M -mtime +7 \) -o -mtime +30 \) -exec truncate {} --size 0 \;
package-cleanup --quiet --leaves
package-cleanup --quiet --leaves | xargs yum remove -y
rm -rf /root/.wp-cli/cache/*
rm -rf /home/*/.wp-cli/cache/*
(( $(rpm -E %{rhel}) >= 8 )) && dnf remove $(dnf repoquery --installonly --latest-limit=-2 -q)
(( $(rpm -E %{rhel}) <= 7 )) && package-cleanup --oldkernels --count=2
(( $(rpm -E %{rhel}) >= 8 )) && dnf remove $(dnf repoquery --installonly --latest-limit=-1 -q)
(( $(rpm -E %{rhel}) <= 7 )) && package-cleanup --oldkernels --count=1
rm -rf /root/.composer/cache
rm -rf /home/*/.composer/cache
 find -regex ".*/core\.[0-9]+$" -delete
find /home/*/public_html/ -name error_log -delete
rm -rf /root/.npm /home/*/.npm /root/.node-gyp /home/*/.node-gyp /tmp/npm-*
rm -rf /var/cache/mock/* /var/lib/mock/*

df -h
sleep 5


