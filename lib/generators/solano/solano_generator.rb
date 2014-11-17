class SolanoGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :hipchat_api_key, type: :string, required: true
  argument :hipchat_room_id, type: :string, required: true
  argument :deploy_hook_url, type: :string, required: false

  def create_solano_yml
    template 'solano.yml.erb', '.solano.yml'
  end

end
