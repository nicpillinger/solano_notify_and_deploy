require 'notification_and_deployment'

namespace :deploy do
  include NotificationAndDeployment

  desc 'run the deploy (notify hipchat on failure)'
  task :production do
    notify "Requesting deployment", "green"
    deploy
  end

end
