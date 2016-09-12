#!/usr/bin/env ruby

require 'daemons'

Daemons.run(__dir__ + '/worker.rb')
#Daemons.run(__dir__ + '/worker.rb', {:monitor => true})
#Daemons.run('worker.rb', {:monitor => true})
