require 'solano_notify_and_deploy'
require 'rails'

module SolanoNotifyAndDeploy
  class Railtie < Rails::Railtie
    railtie_name :solano_notify_and_deploy

    rake_tasks do
      load File.join(File.dirname(__FILE__), "tasks/solano.rake")
    end

    generators do
      require "generators/solano/solano_generator"
    end
  end
end
