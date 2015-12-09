ruby -v
rvm -v
rvm get stable
echo "source ~/.profile">> ~/.profile
nano ~/.profile
rvm list
rvm gemset create heikki
rvm gemset use heikki
rvm gemdir
gem install feedjira
