require 'releaser/version'

module Releaser
  require 'releaser/commands'

  def self.root
    File.dirname __dir__
  end
end
