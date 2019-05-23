#!/bin/sh

if [ $# -gt 0 ] ; then
    echo "usage: updateLdapPassword.sh"
    exit;
fi

java -cp hazelcast-mancenter-3.11.3.war com.hazelcast.webmonitor.security.spi.impl.ldap.UpdateLdapPassword
