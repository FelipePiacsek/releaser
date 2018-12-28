require_relative '../../lib/releaser/clients/github_client'
require_relative 'planner'

class ReleaseGenerator
  ONEAPI_REPO_ID = 103_977_523
  RKPCORE_REPO_ID = 52_028_453
  def initialize(repository = ONEAPI_REPO_ID)
    @client = GithubClient.new
    @repository = repository
  end

  def generate
    Releaser::Planner.new(@client).plan(@repository)
  end

end
