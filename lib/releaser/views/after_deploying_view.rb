require_relative 'renderers'
require_relative 'base_view'
require_relative '../utils/string'

module Releaser
  class AfterDeployingView < BaseView

    def initialize(pull_requests)
      @pull_requests = pull_requests
    end

    def render
      phase = 'after'
      template = template_string!('partials/deploying_tasks.txt.erb')
      deploying_tasks = @pull_requests.map { |pr| fetch_after_deploying_tasks pr }
      deploying_tasks = deploying_tasks.reject { |task| Releaser::Utils::String.blank? task }

      vars = { deploying_tasks: deploying_tasks, phase: phase }

      Releaser::Renderers.erb template, vars
    end

    private

    def fetch_after_deploying_tasks(pr)
      raw_message = pr.body
      after_deploy_text = nil

      after_deploy_marker = raw_message[/### After deploying(.*?)\n/]

      unless after_deploy_marker.nil?
        after_deploy_marker_index = raw_message.index(after_deploy_marker)
        unless after_deploy_marker_index.nil?
          begin_index = after_deploy_marker_index + after_deploy_marker.size
          end_index = raw_message.size
          after_deploy_text = raw_message.slice begin_index, end_index
        end
      end

      after_deploy_text
    end

  end
end
