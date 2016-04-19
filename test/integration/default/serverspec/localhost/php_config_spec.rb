require 'spec_helper'

describe file("/etc/php5/fpm/pool.d/www.conf") do
  it { should contain("listen = 127.0.0.1:9000") }
end
