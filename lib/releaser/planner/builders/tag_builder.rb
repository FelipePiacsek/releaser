require_relative '../renderers'
require_relative 'base_template_builder'

module Releaser
  class TagBuilder < BaseTemplateBuilder
    def build
      template = template_string!('partials/tag.txt.erb')
      vars = { tag: Time.now.strftime("%Y%m%d") }
      Releaser::Renderers.erb template, vars
    end
  end
end