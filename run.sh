#!/bin/bash
echo "             __              __                __              __    "
echo ".----.-----.|__|______.----.|  |--.-----.----.|  |--.--------.|  |--."
echo "|   _|  _  ||  |______|  __||     |  -__|  __||    <|        ||    < "
echo "|__| |   __||__|      |____||__|__|_____|____||__|__|__|__|__||__|__|"
echo "     |__|     "
if [ ! -d /omd/sites/monitoring ]; then
  ./init.sh
fi
if ! id monitoring &>/dev/null; then
    groupadd -g 1000 monitoring
    useradd -g 1000 -u 1000 -ms /bin/bash -d /omd/sites/monitoring monitoring
    usermod -aG mon www-data
    usermod -aG omd monitoring
    omd enable monitoring
else
    omd start monitoring
    sleep infinity
omd start monitoring
sleep infinity
fi
