##
# This class encapsulates the communication with Github API.
# By default, it will use Octokit as the client.
# For more info on Octokit, please check this: https://github.com/octokit/octokit.rb
class GithubClient
  # In order to scale and make Bitbucket integration easier, Encoders/Decoders
  # should be taken into consideration in order to standardize the data
  DEFAULT_PAGINATION_AMOUNT = 100

  def initialize
    @client = github_api_client
  end

  def available_repositories
    @client.repositories
  end

  def pull_requests(repository_id, **options)
    options[:per_page] = options[:per_page] || DEFAULT_PAGINATION_AMOUNT
    @client.pull_requests(repository_id, options)
  end

  def unreleased_pull_requests(repository_id)
    last_release_sha = @client.last_release_sha repository_id
    last_prs = pull_requests(repository_id, state: :closed)
    last_prs.take_while { |pr| pr.merge_commit_sha != last_release_sha }
  end

  protected

  def github_api_client
    require 'octokit'
    Octokit::Client.new(netrc: true)
  end

  private

  def last_release_sha(repository_id)
    tags = @client.tags repository_id
    tags.empty? ? nil : tags.first.commit.sha
  end

end
