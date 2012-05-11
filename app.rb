require File.dirname(__FILE__) + '/banner'

set :root, File.dirname(__FILE__)

Sinatra::Base.mime_type('xib', 'application/octet-stream')

get '/' do
  haml :index
end

post '/generate' do
  text = params[:text] || ''

  attachment '%i.xib' % Time.now

  banner(text).to_s
end
