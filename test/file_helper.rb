require_relative 'constants/fixture_paths'

module FileHelper
  include FixturePaths

  def fixture_file(path)
    File.open "test/fixtures/#{path}"
  end

  def github_user_fixture_path(path)
    "#{GITHUB_USER_PATH}/#{path}"
  end
end