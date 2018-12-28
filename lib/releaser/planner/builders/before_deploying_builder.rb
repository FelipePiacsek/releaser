require_relative '../renderers'
require_relative 'base_template_builder'
require_relative '../../utils/string'

module Releaser
  class BeforeDeployingBuilder < BaseTemplateBuilder

    def initialize(pull_requests)
      @pull_requests = pull_requests
    end

    def build
      phase = 'before'
      template = template_string!('partials/deploying_tasks.txt.erb')
      deploying_tasks = @pull_requests.map { |pr| fetch_before_deploying_tasks pr }
      deploying_tasks = deploying_tasks.reject { |task| Releaser::Utils::String.blank? task }

      vars = { deploying_tasks: deploying_tasks, phase: phase }

      Releaser::Renderers.erb template, vars
    end

    private

    def fetch_before_deploying_tasks(pr)
      raw_message = pr.body
      before_deploy_text = nil

      begin_marker = raw_message[/### Before deploying(.*?)\n/]
      end_marker = raw_message[/### After deploying(.*?)\n/]

      if !begin_marker.nil? && !end_marker.nil?
        begin_regex = Regexp.escape(begin_marker)
        end_regex = Regexp.escape(end_marker)
        before_deploy_text = raw_message[/#{begin_regex}(.*?)#{end_regex}/m, 1]
      elsif !begin_marker.nil?
        # Better than nothing, but bad as it might return more content
        # than desired if before deploying section is not the last one in the PR
        before_deploy_text = raw_message.gsub begin_marker, ''
      end

      before_deploy_text
    end

  end
end
