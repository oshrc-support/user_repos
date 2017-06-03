#!/bin/bash

#Get current working directory.
cwd="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#This is a list of all storage node aliases and are space seperated. There is no limit on the number of items.
#You will need to modify the below line for any of the scripts in this directory to work.
#SSH cert-based authentication and SSH Aliases need setup between the fogTesting box and all below storageNodes.
#storageNodes=( fogsite1 fogsite2 downtown uptown dallas houston floor1 floor2 japan uk )
storageNodes=( Arch CentOS7 CentOS6 Debian8 Fedora25 Fedora26 Ubuntu17 Ubuntu16 Ubuntu14 Mint18 )

#The name of the linux KVM+libvirtd host and is only used for the snapshot related scripts:
hostsystem="optiplex"
gitDir="/root/git"

sshTimeout=15 #seconds to wait for ssh connection to be established when running remote commands.

osTimeout="20m"
fogTimeout="20m"
sshTime="${sshTimeout}s"

captureLimitUnit="30"
captureLimit="60" #This is how long a capture has to get done measured by "captureLimitUnit".

deployLimitUnit="30"
deployLimit="180" #Measured in "deployLimitUnit" which is seconds.

report="/root/report.txt"
output="/root/output.log"
installer_dashboard="/root/installer_dashboard.html"
imaging_dashboard="/root/imaging_dashboard.html"
redfile="red.png"
orangefile="orange.png"
greenfile="green.png"
red="<img src=\"${redfile}\" alt=\"Failure\" title=\"Failure\">"
orange="<img src=\"${orangefile}\" alt=\"Possible issue\" title=\"Possible issue\">"
green="<img src=\"${greenfile}\" alt=\"Success\" title=\"Success\">"




webdir="/var/www/html/fog_distro_check"
permissions="www-data:www-data"
domainName="perpetuum.io"
netdir="/fog_distro_check"
port=":20080"

#This is how you would use your Public IP instead of a domain name:
#publicIP=$(/usr/bin/curl -s http://whatismyip.akamai.com/)
#domainName=$publicIP

#The local shared directory where postinitscripts and postdownloadscripts puts stuff.
shareDir="/fogtesting"
sharePermissions="fogtesting:fogtesting"



#These settings are for the long-standing test FOG Server. It's for testing FOG Functionality.
#SSH aliases and cert-based auth should be setup between the fogTesting box and this box.
testServerUserToken="ZjBkMmE3YmI5NmUzZDcxYTliYzNkZTc4MmJhNTFiYTQ3Mzc2MTg5MzYxMThmNjA5NDYyMjllMTA5YzE0NWUxMjFiNzkyMTc5OTMwZjFhZGM5NWIxMTc3YWZmNTU2MmMwYjFhNjg0NjVmMTkyMGZkNDQxYmY0MzI1NWNkMzQyM2M="
testServerApiToken="MzI2NDY1NjY2NjM0MzUzMDMzMzA2MzM1MzEzNzYyMzg2NTYyNjQ2MjMxMzczMTM0NjY2NDM0NjUzOTM2NjIzNDM4MzQ2NDM3MzY2MzM2MzMzNjYyMzUzODY0MzUzNDYyMzgzMDY2NjQzNTMxMzI2MzM5NjYzNjYzMzMzMzM0MzA="
testServerVMName="testServer"
testServerIP="10.0.0.28"
testServerSshAlias="testServer"


#These are settings for a VM that will be used to test capture & deploy with, and other fog functionality.
#It uses libvirtd & KVM style snapin management, rebooting, and should be set to boot to NIC first.
#Further host testing should be done in postinitscripts and postdownloadscripts from here.
#Snapshots should be prepared with various OSs and partition layouts for testHost1.
#testHost2 should have a smaller disk, testHost3 should have a larger disk.
#Because of multiple OSs being tested with one VM, it's not yet possible to test Snapins.

testHost1VM="testHost1"
testHost1ID="1"
testHost1Disk="/data/pool2/testHost1.qcow2"

testHost1Snapshot1="win10"
testHost1ImageID="1"


testHost2VM="testHost2"
testHost2ID="2"

testHost3VM="testHost3"
testHost3ID="3"


testHostDisksDir="/data/pool3"
blankSnapshot="blank"



