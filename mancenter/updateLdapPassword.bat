@ECHO OFF

set argC=0
for %%x in (%*) do Set /A argC+=1
set help=false

if %argC% gtr 0 set help=true

if %help% == true (
    echo usage: updateLdapPassword.bat
)

if %argC% == 0 (
    java -cp hazelcast-mancenter-3.11.3.war com.hazelcast.webmonitor.security.spi.impl.ldap.UpdateLdapPassword
)
