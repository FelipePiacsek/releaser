require_relative '../../lib/releaser/models/pull_request'
require_relative '../file_helper'
require 'json'

class GithubApiClientMock
  include FileHelper
  def pull_requests(scenario_file_path, _options)
    json_string = fixture_file(scenario_file_path).read
    json_parse json_string
  end

  def user(user_id)
    json_string = fixture_file("users/#{user_id}.json").read
    json_parse(json_string)
  end

  private

  def json_parse(json_string)
    JSON.parse(json_string, symbolize_names: true)
  end
end