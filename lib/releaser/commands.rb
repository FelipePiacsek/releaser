require 'thor'
require_relative 'release_generator'
require_relative 'clients/github_client'
require_relative 'clients/authentication_error'

module Releaser
  class Commands < Thor

    desc 'plan REPOSITORY_NAME', 'Outputs the release details, but does not actually perform the release on the given repository'
    def plan(repository_name)
      begin
        generator = ReleaseGenerator.new GithubClient.new
        release_message = generator.generate
        puts release_message
      rescue AuthenticationError => e
        puts "Github authentication file is not set. In order to configurate, please run:"
        puts "releaser config"
      end
    end

    desc 'config', 'Requests user credentials for Github'
    def config

    end
  end
end
