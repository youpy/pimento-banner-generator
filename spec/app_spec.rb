require File.dirname(__FILE__) + '/spec_helper'

describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '/' do
    it 'should respond to /' do
      get '/'
      last_response.status.should == 200
    end
  end

  describe '/generate' do
    it 'should respond to /generate with parameters' do
      post '/generate', :text => 'aaa'

      last_response.status.should == 200
      last_response.content_type.should == 'application/octet-stream'
      last_response['content-disposition'].should =~ /^attachment; filename="\d+\.xib"/
      last_response.body.should =~ /<\?xml/
    end
  end
end
