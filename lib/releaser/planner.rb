require_relative '../../lib/releaser/clients/github_client'
require_relative 'views/empty_release_view'

## Releaser plan builder.
# Only exposes plan method. By default uses github as client.
module Releaser
  class Planner

    def initialize(client = default_client)
      @client = client
    end

    ## Returns the release plan for the given repository.
    # Builds the release plan based on template partials, if there are unreleased pull requests.
    # Returns an "empty_release_template" if there is nothing to be released.
    def plan(repository_id)
      prs = @client.unreleased_pull_requests repository_id
      if prs.empty?
        last_release = @client.tags(repository_id).first
        Releaser::EmptyReleaseView.new(last_release).render
      else
        raise NotImplementedError
      end
    end

    private

    def default_client
      GithubClient.new
    end
  end
end
