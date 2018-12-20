require_relative 'constants/fixture_paths'

module FileHelper
  include FixturePaths

  def fixture_file(path)
    File.open "test/fixtures/#{path}"
  end
end