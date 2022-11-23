#!/bin/bash
bundle install
yarn install
SKIP_POST_DEPLOYMENT_MIGRATIONS=true RAILS_ENV=production bundle exec rails db:migrate
RAILS_ENV=production bundle exec rails assets:clobber assets:precompile   
RAILS_ENV=production bin/tootctl cache clear
RAILS_ENV=production bundle exec rails db:migrate
