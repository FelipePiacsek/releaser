module Scenarios
  # TODO: GITHUB_4_UNRELEASED_3_RELEASED = {
  #   input:  { pull_requests: '...', tags: '...' }
  #   output: { contributors: '...', full_release: '...' }
  # }
  GITHUB_4_UNRELEASED_3_RELEASED = {
      pull_requests: 'scenarios/github/4_unreleased_and_3_released_prs.json'.freeze,
      tags: 'scenarios/github/4_unreleased_and_3_released_tags.json'.freeze,
      contributors: 'scenarios/github/4_unreleased_and_3_released_expected_contributors_template.txt'.freeze,
      full_release: 'scenarios/github/4_unreleased_and_3_released_expected_full_release_template.txt'.freeze,
  }.freeze

  GITHUB_0_UNRELEASED_0_RELEASED = {
      pull_requests: 'scenarios/github/0_unreleased_and_0_released_prs.json'.freeze,
      tags: 'scenarios/github/0_unreleased_and_0_released_tags.json'.freeze,
      empty_release: 'scenarios/github/0_unreleased_and_0_plan_result.txt'.freeze
  }.freeze

  GITHUB_WITHOUT_BEFORE_DEPLOYING = GITHUB_WITHOUT_AFTER_DEPLOYING = {
      pull_requests: 'scenarios/github/without_after_deploying_prs.json'.freeze
  }.freeze

  GITHUB_WITH_AFTER_DEPLOYING_BUT_ONLY_WHITESPACES_IN_BODY = {
      pull_requests: 'scenarios/github/with_after_deploying_and_whitespaces_in_body_prs.json'.freeze
  }.freeze

  GITHUB_WITH_AFTER_DEPLOYING_BUT_ONLY_NEWLINES_IN_BODY = {
      pull_requests: 'scenarios/github/with_after_deploying_and_newlines_in_body_prs.json'.freeze
  }.freeze

  GITHUB_WITH_BEFORE_DEPLOYING_BUT_ONLY_WHITESPACES_IN_BODY = {
      pull_requests: 'scenarios/github/with_before_deploying_and_whitespaces_in_body_prs.json'.freeze
  }.freeze

  GITHUB_WITH_BEFORE_DEPLOYING_BUT_ONLY_NEWLINES_IN_BODY = {
      pull_requests: 'scenarios/github/with_before_deploying_and_newlines_in_body_prs.json'.freeze
  }.freeze

  GITHUB_WITH_AFTER_DEPLOYING_AND_NON_BLANK_BODY = {
      pull_requests: 'scenarios/github/with_after_deploying_and_non_blank_body_prs.json'.freeze
  }.freeze

  GITHUB_WITH_AFTER_DEPLOYING_AND_BEFORE_DEPLOYING = {
      pull_requests: 'scenarios/github/with_after_deploying_and_before_deploying_prs.json'.freeze,
      full_release: 'scenarios/github/with_after_deploying_and_before_deploying_expected_full_release_template.txt'.freeze,
  }.freeze

  GITHUB_WITHOUT_AFTER_DEPLOYING_AND_WITH_BEFORE_DEPLOYING = {
      pull_requests: 'scenarios/github/without_after_deploying_and_with_before_deploying_prs.json'.freeze
  }.freeze

  GITHUB_WITH_BEFORE_DEPLOYING_AND_OTHER_CONTENT_IN_BODY = {
      pull_requests: 'scenarios/github/with_before_deploying_and_other_content_in_body_prs.json'.freeze
  }.freeze
end