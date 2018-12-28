require_relative '../renderers'
require_relative 'base_template_builder'

module Releaser
  class EmptyReleaseBuilder < BaseTemplateBuilder

    def initialize(last_release)
      @last_release_title = last_release.nil? ? nil : last_release.name
    end

    def build
      template = template_string!('empty_release_template.txt.erb')
      vars = {last_release_title: @last_release_title}

      Releaser::Renderers.erb template, vars
    end
  end
end
