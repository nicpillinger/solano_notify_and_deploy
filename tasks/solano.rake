namespace :solano do

  desc 'notify hipchat on build events'
  task :notify, :hipchat_api_key, :hipchat_room_id do |t, args|
    notify_build_status args[:hipchat_api_key], args[:hipchat_room_id]
  end

  desc 'notify hipchat on build events, deploy on successful build'
  task :notify_and_deploy, :hipchat_api_key, :hipchat_room_id, :deploy_hook_url do |t, args|

    notify_build_status args[:hipchat_api_key], args[:hipchat_room_id]
    return unless build_passed?

    succeeded = false
    message = ""

    begin
      succeeded = deploy
    rescue Exception => e
      succeeded = false
      message = e.message
    end

    unless succeeded
      notify  args[:hipchat_api_key], args[:hipchat_room_id], "Deploy failed: #{message}", 'red'
      raise "deployment failed"
    end
  end

  private

    def tddium?
      ENV['TDDIUM'].present?
    end

    def passed?
      ENV['TDDIUM_BUILD_STATUS'] == 'passed'
    end

    def build_passed?
      tddium? && passed?
    end

    def deploy(url)
      system "curl -X POST -d \"\" #{url}"
    end

    def notify_build_status(hipchat_api_key, hipchat_room_id)
      notify hipchat_api_key, hipchat_room_id, "Build succeeded", "green" and return if build_passed?
      notify hipchat_api_key, hipchat_room_id, "Build failed", "red"
    end

    def notify(hipchat_api_key, hipchat_room_id, message, colour)
      client = HipChat::Client.new(hipchat_api_key)
      client[hipchat_room_id].send('Solano', message, :color => colour)
    end

end
