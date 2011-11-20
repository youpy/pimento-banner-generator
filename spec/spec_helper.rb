require 'bundler'
require 'rack/test'

Bundler.require(:default, :test)

require File.dirname(__FILE__) + '/../app'

set :environment, :test

RSpec.configure do |config|
  def fixture(filename)
    File.dirname(__FILE__) + '/fixtures/' + filename
  end

  config.before(:each) do
  end
end
