require_relative 'base_view'
require_relative 'intro_view'
require_relative 'tag_view'
require_relative 'title_view'
require_relative 'changes_view'
require_relative 'before_deploying_view'
require_relative 'after_deploying_view'
require_relative 'renderers'
require_relative 'contributors_view'

module Releaser
  class FullReleaseView < BaseView

    def initialize(pull_requests)
      @pull_requests = pull_requests
    end

    def render
      template = template_string! 'full_release_template.txt.erb'
      vars = {
          intro: IntroView.new.render,
          tag: TagView.new.render,
          title: TitleView.new.render,
          changes: ChangesView.new(@pull_requests).render,
          before_deploying_tasks: BeforeDeployingView.new(@pull_requests).render,
          after_deploying_tasks: AfterDeployingView.new(@pull_requests).render,
          contributors: ContributorsView.new(@pull_requests).render
      }

      Releaser::Renderers.erb template, vars
    end
  end
end