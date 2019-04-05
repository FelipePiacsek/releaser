require_relative '../../lib/releaser/models/pull_request'
require_relative '../file_helper'
require 'json'

class GithubApiClientMock
  include FileHelper
  def pull_requests(scenario, _options)
    json_string = fixture_file(scenario[:pull_requests]).read
    json_parse json_string
  end

  def user(user_id)
    user_file_path = github_user_fixture_path "#{user_id}.json"
    json_string = fixture_file(user_file_path).read
    json_parse(json_string)
  end

  def tags(scenario)
    json_string = fixture_file(scenario[:tags]).read
    json_parse json_string
  end

  def check_credentials!; end

  private

  def json_parse(json_string)
    JSON.parse(json_string, symbolize_names: true)
  end
end
