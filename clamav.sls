clamav:
  pkg:
    - installed
    {% if grains['os_family'] == 'RedHat' %}
    - names:
      - clamav
      - clamd
    {% elif grains['os_family'] == 'Debian' %}
    - names:
      - clamav
      - clamav-daemon
    {% endif %}

freshclam:
  cmd.run:
    - name: /usr/bin/freshclam
    - require:
      - pkg: clamav

