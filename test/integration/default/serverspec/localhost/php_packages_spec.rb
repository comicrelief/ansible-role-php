require 'spec_helper'

#Check if php5 is installed correctly
describe command("which php5") do
  its(:stdout) { should match("/usr/bin/php5") }
end

#Check if php5-fpm is installed correctly
describe command("which php5-fpm") do
  its(:stdout) { should match("/usr/sbin/php5-fpm") }
end
