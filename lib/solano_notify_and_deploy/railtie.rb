require 'solano_notify_and_deploy'
require 'rails'

module SolanoNotifyAndDeploy
  class Railtie < Rails::Railtie
    railtie_name :solano_notify_and_deploy

    rake_tasks do
      load "tasks/deploy.rake"
    end
  end
end
