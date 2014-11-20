solano_notify_and_deploy
========================

Solano labs build notifications to hipchat and optional deploys of Rails applications

Generator
========

The gem includes a rails generator which will create a solano.yml file
in the root of your rails app. It also configures a set of rake tasks.

Usage:
---
Run the generator to create the solano.yml and rake files. Customise them (eg. build start notifications are currently disabled by default in the solano.yaml). Commit them and trigger a build in Solano labs (use a github service hook to have this happen automatically on commit). Solano labs will pick up the solano.yaml and use the rake tasks in to trigger notifications to hipchat and deploy events.

    rails g solano HIPCHAT_API_KEY HIPCHAT_ROOM_ID DEPLOY_HOOK_URL


Rake Tasks
=========

The generator creates rake files at lib/tasks/solano.rake and lib/tasks/deploy.rake. It configures a number of rake tasks for use during the Solano Labs CI process. It also provides a manual deploy task.

    solano:notify:build_start

provides a task to notify hipchat that ci run has started (used by Solano Labs CI process - configured in solano.yml).

    solano:notify:build_complete

notify hipchat that ci run has completed and the status, success or failure (used by Solano Labs CI process - configured in solano.yml).

    solano:notify_and_deploy

notify hipchat that ci run has completed (success or failure) and deploy on success (used by Solano Labs CI process - configured in solano.yml).

    deploy:production

manually hit the web deploy hook url to deploy the app to production - you can run this rake task to deploy to production at any time.
