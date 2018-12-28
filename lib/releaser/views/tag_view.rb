require_relative 'renderers'
require_relative 'base_view'

module Releaser
  class TagView < BaseView
    def build
      template = template_string!('partials/tag.txt.erb')
      vars = { tag: Time.now.strftime("%Y%m%d") }
      Releaser::Renderers.erb template, vars
    end
  end
end
