class ReleaseGenerator
  ONEAPI_REPO_ID = 103_977_523
  RKPCORE_REPO_ID = 52_028_453
  def initialize(repository = ONEAPI_REPO_ID)
    @client = Octokit::Client.new(netrc: true)
    @repository = repository
  end

  def generate
    prs = unreleased_prs
    contributors = fetch_contributors prs
    build_release_message prs, contributors
  end

  private

  # Will fail if there are more than 50 unreleased PRs.
  def unreleased_prs
    last_release_sha = @client.tags(@repository).first.commit.sha
    last_prs = @client.pull_requests(@repository, state: :closed, per_page: 50)
    last_prs.take_while { |pr| pr.merge_commit_sha != last_release_sha }
  end

  def fetch_contributors(prs)
    contributors_hash = {}

    prs.each do |pull_request|
      id = pull_request.user.id
      contributors_hash[id] = @client.user(id) unless contributors_hash[id]
    end

    contributors_hash.values
  end

  def build_release_message(prs, contributors, template_file = 'github_release_template.txt')
    changes = []
    tasks = {}
    prs.each do |pull_request|
      contributor = contributors.find { |c| pull_request.user.id == c.id }
      tasks[pull_request.number] = fetch_deploying_tasks pull_request
      changes << "**PR ##{pull_request.number}** - **#{pull_request.title}** *powered by #{contributor.name}*"
    end
    changes_text = changes.join("\n")
    before_deploying_text = build_deploy_text tasks, :before
    after_deploying_text = build_deploy_text tasks, :after

    contributors_text = contributors.map { |c| "#{c.name} | #{c.email}"}.join("\n")
    formatted_time = Time.now.strftime("%Y%m%d")
    template = File.read("./lib/releaser/templates/#{template_file}")
    template % { changes: changes_text,
                 contributors: contributors_text,
                 before_deploying_tasks: before_deploying_text,
                 after_deploying_tasks: after_deploying_text,
                 tag: formatted_time,
                 title: formatted_time,
               }
  end

  def build_deploy_text(tasks, phase)
    existing_tasks = tasks.values.reject { |t| t[phase].nil? }.map { |t| t[phase] }
    if existing_tasks.empty?
      "\n"
    else
      "ATTENTION: There are tasks to be performed #{phase.to_s.upcase} deploying:\n\n #{existing_tasks.map(&:strip).join("\n\n")}\n"
    end
  end

  def fetch_deploying_tasks(pull_request)
    raw_message = pull_request.body
    before_deploy_text = nil
    after_deploy_text = nil

    before_deploy_marker = raw_message[/### Before deploying(.*?)\n/]
    after_deploy_marker = raw_message[/### After deploying(.*?)\n/]

    if !before_deploy_marker.nil? && !after_deploy_marker.nil?
      before_deploy_text = raw_message[/#{Regexp.escape(before_deploy_marker)}(.*?)#{Regexp.escape(after_deploy_marker)}/m, 1]
    elsif !before_deploy_marker.nil?
      before_deploy_text = raw_message.slice(raw_message.index(before_deploy_marker) + 1, raw_message.index) # FIXME: Pass arguments to `raw_message.index` method call
    end

    unless after_deploy_marker.nil?
      after_deploy_marker_index = raw_message.index(after_deploy_marker)
      unless after_deploy_marker_index.nil?
        after_deploy_text = raw_message.slice(after_deploy_marker_index + after_deploy_marker.size, raw_message.size)
      end
    end

    {
        before: before_deploy_text,
        after: after_deploy_text,
    }
  end
end