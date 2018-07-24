require 'sinatra/base'
require 'sinatra/reloader'

class Web < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  before do
    content_type :json
  end

  get '/' do
    content_type :html
    status 200

    'Hello World'
  end

  get '/ping' do
    status 200

    'PONG!!!'.to_json
  end

end
