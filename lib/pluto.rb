###
# NB: for local testing run like:
#
# 1.9.x: ruby -Ilib lib/pakman.rb

# core and stlibs

require 'yaml'
require 'pp'
require 'logger'
require 'optparse'
require 'fileutils'

require 'rss'

# rubygems

require 'active_record'   ## todo: add sqlite3? etc.


require 'logutils'
require 'fetcher'   # fetch (download) files
require 'pakman'    # template pack manager 


# our own code

require 'pluto/version'   # let version always get first
require 'pluto/schema'
require 'pluto/models'
require 'pluto/fetcher'
require 'pluto/formatter'

require 'pluto/cli/opts'
require 'pluto/cli/runner'

module Pluto

  def self.banner
    "pluto #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

  def self.main
    Runner.new.run(ARGV)
  end

end  # module Pluto


Pluto.main if __FILE__ == $0