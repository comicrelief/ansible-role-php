require 'spec_helper'

#Check if imagick php module is installed
describe command("php -m | grep -i imagick") do
  its(:stdout) { should match("imagick") }
end

#Check if mysql php module is installed
describe command("php -m | grep -i mysql") do
  its(:stdout) { should match("mysql") }
end

#Check if memcache php module is installed
describe command("php -m | grep -i memcache") do
  its(:stdout) { should match("memcache") }
end
