require_relative '../../lib/releaser/clients/github_client'
require_relative '../../test/mocks/github_api_client_mock'

class GithubClientMock < GithubClient
  def github_api_client
    GithubApiClientMock.new
  end
end