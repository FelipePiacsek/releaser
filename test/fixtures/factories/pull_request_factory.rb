require_relative '../../file_helper'
require_relative '../../constants/paths'
require_relative '../../../lib/releaser/models/pull_request'
require 'json'

module Factories
  module PullRequest
    include FileHelper
    include Paths

    def pull_request_list(scenario = GITHUB_4_UNRELEASED_3_RELEASED)
      pr_file_content = fixture_file(scenario[:pull_requests]).read
      prs_hash = JSON.parse(pr_file_content, symbolize_names: true)

      prs_hash.map do |pr|
        user_file_path = github_user_fixture_path "#{pr[:user][:id]}.json"
        user_string = fixture_file(user_file_path).read
        user = JSON.parse(user_string, symbolize_names: true)

        ::PullRequest.new(pr, user)
      end
    end

    def pull_request_sample
      pull_request_list.sample
    end
  end
end
