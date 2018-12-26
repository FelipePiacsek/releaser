require_relative '../../../lib/releaser/models/pull_request'
require_relative '../../../lib/releaser/models/user'
require_relative '../../../lib/releaser/models/tag'

##
# This class encapsulates the communication with Github API.
# By default, it will use Octokit as the client.
# For more info on Octokit, please check this: https://github.com/octokit/octokit.rb
class GithubClient
  DEFAULT_PAGINATION_AMOUNT = 100

  def initialize(api_client = default_api_client)
    @client = api_client
    @users_cache = {}
  end

  def available_repositories
    @client.repositories
  end

  def user(user_id)
    attrs_hash = fetch_user(user_id).to_h

    User.new attrs_hash
  end

  def pull_requests(repository_id, **options)
    pull_requests = fetch_pull_requests repository_id, options

    decode_pull_requests pull_requests
  end

  def tags(repository_id)
    tags = fetch_tags repository_id

    decode_tags tags
  end

  def unreleased_pull_requests(repository_id)
    last_release_sha = last_release_sha repository_id
    last_prs = fetch_pull_requests(repository_id, state: :closed)
    unreleased = last_prs.take_while { |pr| pr[:merge_commit_sha] != last_release_sha }

    decode_pull_requests unreleased
  end

  private

  def default_api_client
    require 'octokit'
    Octokit::Client.new(netrc: true)
  end

  def fetch_pull_requests(repository_id, **options)
    options[:per_page] = options[:per_page] || DEFAULT_PAGINATION_AMOUNT
    @client.pull_requests(repository_id, options)
  end

  def fetch_user(user_id)
    if @users_cache.key?(user_id)
      @users_cache[user_id]
    else
      @users_cache[user_id] = @client.user user_id
    end
  end

  def last_release_sha(repository_id)
    tags = @client.tags repository_id
    tags.empty? ? nil : tags.first[:commit][:sha]
  end

  def fetch_tags(repository_id)
    @client.tags repository_id
  end

  def decode_pull_requests(pull_requests)
    pull_requests.map do |pr|
      pr_attrs = pr.to_h
      contributor_attrs = fetch_user(pr[:user][:id]).to_h
      PullRequest.new(pr_attrs, contributor_attrs)
    end
  end

  def decode_tags(tags)
    tags.map { |t| Tag.new(t.to_h) }
  end

end
