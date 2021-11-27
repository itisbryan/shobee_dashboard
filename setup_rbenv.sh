Q[0]="DROP USER IF EXISTS 'shobee_dashboard'@'localhost';"
Q[1]="FLUSH PRIVILEGES;"
Q[2]="CREATE USER 'shobee_dashboard'@'localhost' IDENTIFIED BY 'shobeedevelopment';"
Q[3]="GRANT ALL PRIVILEGES ON \`shobee_dashboard\_%\`.* TO 'shobee_dashboard'@'localhost';"

for i in "${Q[@]}"; do
  echo $i
  mysql -uroot -e "$i"
done

# This will setup rbenv, bundle install, and setup the dev, test, and
# capybara databases. You do not need to run migrations because we have
# a seeds file that mirrors them. Therefore, this just runs reset for them.

cat .ruby-version | xargs rbenv install;
rbenv rehash && rbenv exec gem install bundler -v $(tail -n1 Gemfile.lock) &&
rbenv exec bundle install --path=vendor/bundle &&
rbenv exec bundle exec rake db:reset
