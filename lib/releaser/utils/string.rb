require 'concurrent/map'

module Releaser
  module Utils
    module String

      # Snatched from ActiveSupport.
      # A string is blank if it's empty or contains whitespaces only:
      #
      #   ''.blank?       # => true
      #   '   '.blank?    # => true
      #   "\t\n\r".blank? # => true
      #   ' blah '.blank? # => false
      #
      # Unicode whitespace is supported:
      #
      #   "\u00a0".blank? # => true
      #
      # @return [true, false]
      def self.blank?(str)
        blank_re = /\A[[:space:]]*\z/
        encoded_blanks = Concurrent::Map.new do |h, enc|
          h[enc] = Regexp.new(blank_re.source.encode(enc), blank_re.options | Regexp::FIXEDENCODING)
        end

        begin
          str.nil? || str.empty? || blank_re.match?(str)
        rescue Encoding::CompatibilityError
          encoded_blanks[str.encoding].match?(str)
        end
      end
    end
  end
end