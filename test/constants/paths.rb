module Paths
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

  GITHUB_WITHOUT_BEFORE_DEPLOYING = GITHUB_WITHOUT_AFTER_DEPLOYING = {
      pull_requests: 'scenarios/github/without_after_deploying_prs.json'.freeze
  }

  GITHUB_WITH_AFTER_DEPLOYING_BUT_ONLY_WHITESPACES_IN_BODY = {
      pull_requests: 'scenarios/github/with_after_deploying_and_whitespaces_in_body_prs.json'.freeze
  }

  GITHUB_WITH_AFTER_DEPLOYING_BUT_ONLY_NEWLINES_IN_BODY = {
      pull_requests: 'scenarios/github/with_after_deploying_and_newlines_in_body_prs.json'.freeze
  }

  GITHUB_WITH_BEFORE_DEPLOYING_BUT_ONLY_WHITESPACES_IN_BODY = {
      pull_requests: 'scenarios/github/with_before_deploying_and_whitespaces_in_body_prs.json'.freeze
  }

  GITHUB_WITH_BEFORE_DEPLOYING_BUT_ONLY_NEWLINES_IN_BODY = {
      pull_requests: 'scenarios/github/with_before_deploying_and_newlines_in_body_prs.json'.freeze
  }

  GITHUB_WITH_AFTER_DEPLOYING_AND_NON_BLANK_BODY = {
      pull_requests: 'scenarios/github/with_after_deploying_and_non_blank_body_prs.json'.freeze
  }

  GITHUB_WITH_AFTER_DEPLOYING_AND_BEFORE_DEPLOYING = {
      pull_requests: 'scenarios/github/with_after_deploying_and_before_deploying_prs.json'.freeze
  }

  GITHUB_WITHOUT_AFTER_DEPLOYING_AND_WITH_BEFORE_DEPLOYING = {
      pull_requests: 'scenarios/github/without_after_deploying_and_with_before_deploying_prs.json'.freeze
  }


  # Templates
  TEMPLATES_BASE_PATH = 'lib/releaser/planner/templates'
  INTRO_TEMPLATE_PATH = 'partials/intro.txt.erb'
  TAG_TEMPLATE_PATH = 'partials/tag.txt.erb'
  TITLE_TEMPLATE_PATH = 'partials/title.txt.erb'
  CHANGES_TEMPLATE_PATH = 'partials/changes.txt.erb'
  DEPLOYING_TASKS_TEMPLATE_PATH = 'partials/deploying_tasks.txt.erb'
  EMPTY_RELEASE_TEMPLATE_PATH = 'empty_release_template.txt.erb'
end

