solano_notify_and_deploy
========================

Solano labs build notifications to hipchat and optional deploys of Rails applications

Generator
========

The gem includes a rails generator which will create a solano.yml file
in the root of your rails app. It also configures a set of rake tasks (which live at lib/tasks/solano/deploy.rake).

Usage:
rails g solano HIPCHAT_API_KEY HIPCHAT_ROOM_ID DEPLOY_HOOK_URL

Run the generator and commit the solano.yml and rake tasks file. Solano labs will pick these up and the hooks configured in the solano.yml will trigger notifications and deploy events.
