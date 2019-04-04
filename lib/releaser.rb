require_relative 'releaser/version'

module Releaser
  require_relative 'releaser/commands'

  def self.root
    File.dirname __dir__
  end
end
