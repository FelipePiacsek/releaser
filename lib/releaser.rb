require 'releaser/version'
require 'thor'
require 'octokit'

module Releaser
  require 'releaser/commands'

  def self.root
    File.dirname __dir__
  end
end
