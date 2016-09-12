#/bin/bash
## To update salt-minion via salt-bootstrap 

# Download and install latest salt-minion
cd /tmp && wget https://raw.githubusercontent.com/saltstack/salt-bootstrap/stable/bootstrap-salt.sh
/bin/sh /tmp/bootstrap-salt.sh

cat <<EOT >> /etc/salt/minion
file_roots:
  base:
    - /srv/salt
EOT









