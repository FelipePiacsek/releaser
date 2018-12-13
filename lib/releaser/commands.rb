require_relative 'release_generator'

module Releaser
  class Commands < Thor

    desc 'plan REPOSITORY_NAME', 'Outputs the release details, but does not actually perform the release on the given repository'
    def plan(repository_name)
      generator = ReleaseGenerator.new
      release_message = generator.generate
      puts release_message
    end
  end
end