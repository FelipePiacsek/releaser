module FixturePaths
  GITHUB_USER_PATH = 'users/github'.freeze

  # Scenarios
  GITHUB_4_UNRELEASED_3_RELEASED = {
    pull_requests: 'scenarios/github/4_unreleased_and_3_released_prs.json'.freeze,
    tags: 'scenarios/github/4_unreleased_and_3_released_tags.json'.freeze
  }.freeze

  GITHUB_0_UNRELEASED_0_RELEASED = {
      pull_requests: 'scenarios/github/0_unreleased_and_0_released_prs.json'.freeze,
      tags: 'scenarios/github/0_unreleased_and_0_released_tags.json'.freeze
  }.freeze
end
