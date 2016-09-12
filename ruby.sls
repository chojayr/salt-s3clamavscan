rvm-deps:
  pkg:
    - installed
    - names:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git
      - sudo

mri-deps:
  pkg.installed:
    - names:
      - autoconf
      - automake
      - bison
      - gcc-c++
      - glibc
      - libffi-devel
      - libtool
      - libyaml-devel
      - make
      - openssl-devel
      - patch
      - readline
      - readline-devel
      - zlib
      - zlib-devel

gpg_check:
  cmd.run:
    - name: curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps

ruby-2.1.4:
  rvm.installed:
    - default: True
    - user: root
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps

basic_gems:
  gem:
    - installed
    - ruby: ruby-2.1.4
    - names:
      - bundler
      - rake
      - json
      - OptionParser

highline:
  gem.installed:
    - ruby: ruby-2.1.4
    - version: 1.7.8

activesupport:
  gem.installed:
    - ruby: ruby-2.1.4
    - version: 4.2.5

archive-zip:
  gem.installed:
    - ruby: ruby-2.1.4
    - version: 0.8.0

aws-sdk-v1:
  gem.installed:
    - ruby: ruby-2.1.4

aws-sdk:
  gem.installed:
    - ruby: ruby-2.1.4
    - version: 2.2.29

daemons:
  gem.installed:
    - ruby: ruby-2.1.4
    - version: 1.2.3

mail:
  gem.installed:
    - ruby: ruby-2.1.4

