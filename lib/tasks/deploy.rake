namespace :tddium do

  desc "Run post-build script"
  task :post_build_hook do

    print_status_info

    if deploy?
      deploy_and_notify
    end

  end

  private

  def print_status_info
    puts "tddium? " + tddium?.inspect
    puts "passed? " + passed?.inspect
    puts "deploy? " + deploy?.inspect
  end

  def tddium?
    ENV['TDDIUM'].present?
  end

  def passed?
    ENV['TDDIUM_BUILD_STATUS'] == 'passed'
  end

  def deploy?
    tddium? && passed?
  end

end

namespace :deploy do

  desc "Deploy to the production environment"
  task :production do
    deploy_and_notify
  end

  def deploy_and_notify
    succeeded = false
    message = ""

    begin
      succeeded = deploy
    rescue Exception => e
      succeeded = false
      message = e.message
    end

    if !succeeded
      notify("failed to deploy #{message}", 'red')
      raise "deployment failed"
    end
  end

  def notify(message, colour)
    client = HipChat::Client.new("5fe982f7eb49cff6f0625fb44bfb21")
    client['103243'].send('Tddium', message, :color => colour)
  end

  def deploy
    system deploy_cmd
  end

  def deploy_cmd
    'curl -X POST -d "" https://hooks.cloud66.com/stacks/redeploy/42b2dd20aa87e33a4293dae2e6fb6e78/5f155ebaf3d8e99f322dcd34cf2fcdff'
  end

end
