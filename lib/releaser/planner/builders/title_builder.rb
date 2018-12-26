require_relative '../renderers'
require_relative 'base_template_builder'

module Releaser
  class TitleBuilder < BaseTemplateBuilder
    def build
      template = template_string!('partials/title.txt.erb')
      vars = { title: Time.now.strftime("%Y%m%d") }

      Releaser::Renderers.erb template, vars
    end
  end
end