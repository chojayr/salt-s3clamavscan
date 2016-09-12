/opt/aws-s3-virusscan/s3-virusscan.conf:
  file.managed:
    - source: salt://source/conf/s3-virusscan.conf.template
    - makedirs: True
    - user: root
    - group: root
    - mode: 644
    - template: jinja

daemon:
  file.managed:
    - source: salt://source/s3virusscan/daemon.rb
    - name: /opt/aws-s3-virusscan/daemon.rb
    - user: root
    - group: root
    - mode: 775
    - require:
      - file: /opt/aws-s3-virusscan/s3-virusscan.conf

worker:
  file.managed:
    - source: salt://source/s3virusscan/worker.rb
    - name: /opt/aws-s3-virusscan/worker.rb
    - user: root
    - group: root
    - mode: 775
    - require:
      - file: /opt/aws-s3-virusscan/s3-virusscan.conf

s3-virusscan:
  file.managed:
    - source: salt://source/s3virusscan/s3-virusscan
    - name: /opt/aws-s3-virusscan/s3-virusscan
    - user: root
    - group: root
    - mode: 775

/etc/init.d/s3-virusscan:
  file.symlink:
    - target: /opt/aws-s3-virusscan/s3-virusscan
    - require:
      - file: s3-virusscan

run_daemon:
  cmd.run:
    - name: /usr/local/rvm/wrappers/default/ruby /opt/aws-s3-virusscan/daemon.rb start
    - require:
      - file: daemon
      - file: worker
      - file: /opt/aws-s3-virusscan/s3-virusscan.conf

