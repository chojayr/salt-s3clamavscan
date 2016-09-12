### salt-s3clamavscan


####  A State to set-up aws-s3-virusscan

#### Can be run on Centos 6.x and Ubuntu 14.04 & 16.04

#### For Masterless Minion only



#### Uncomment and set file_client as "local" on /etc/salt/minion
file_client: local

#### Define file_roots:
file_roots:
  base:
    - /srv/salt

#### Run:
$ salt-call --local state.highstate 

