require 'erb'
require 'ostruct'

module Releaser
  module Renderers
    def self.erb(template, **vars)
      vars_to_bind = OpenStruct.new(vars).instance_eval { binding }
      ERB.new(template, nil, '-').result(vars_to_bind)
    end
  end
end
