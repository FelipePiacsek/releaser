require 'thor'

module Releaser
  class Commands < Thor

    desc 'plan REPOSITORY_NAME', 'Outputs the release details, but does not actually perform the release on the given repository'
    def plan(repository_name)
      puts "Planning release for #{repository_name} repository..."
    end
  end
end