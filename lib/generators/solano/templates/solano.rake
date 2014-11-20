require 'notification_and_deployment'

namespace :solano do
  include NotificationAndDeployment

  namespace :notify do
    desc 'build start - notify hipchat'
    task :build_start do
      notify 'CI starting', 'green'
    end

    desc 'build complete - notify hipchat'
    task :build_complete do
      notify_build_status
    end
  end

  desc 'build complete - notify hipchat and deploy on successful build'
  task :notify_and_deploy do
    notify_build_status
    unless build_passed?
      notify "To deploy manually try rake solano:deploy", "yellow"
      next
    end
    deploy
  end
end
