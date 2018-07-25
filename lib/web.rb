require 'sinatra/base'
require 'sinatra/reloader'
require 'sqlite3'
require 'rubyq'

class Web < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # before do
  #   content_type :json
  #   @db = SQLite3::Database.new('data.db')
  #   @db.results_as_hash = true
  # end

  # after do
  #   @db.close unless @db.closed?
  # end

  get '/ping' do
    status 200

    'PONG'
  end

  # post '/staff' do
  #   request.body.rewind
  #   json_data = JSON.parse(request.body.read)

  #   begin
  #     result = @db.execute('INSERT INTO staff (name, created_at) VALUES (?, ?)', [json_data['name'], Time.now.to_i])
  #     p result

  #     ''.to_json
  #   ensure
  #     @db.close unless @db.closed?
  #   end
  # end

  get '/staff' do
    query_builder = Rubyq::QueryBuilder.new
    query = query_builder
      .from('staff')
      .get_query

    # @db.query(query).to_a.to_json
  end

  get '/staff/:id' do
    query_builder = Rubyq::QueryBuilder.new
    query = query_builder
      .from('staff')
      .where('id = ?')
      .get_query

    # staff = @db.query(query, params[:id]).first
    # unless staff.nil?
    #   return staff.to_json
    # end

    # status 404
  end

  delete '/staff/:id' do
    query_builder = Rubyq::QueryBuilder.new
    query = query_builder
      .delete('staff')
      .where('id = ?')
      .get_query

    # @db.execute(query, [params[:id]])
  end

  put '/staff/:id' do
    request.body.rewind
    json_data = JSON.parse(request.body.read)

    query_builder = Rubyq::QueryBuilder.new
    query = query_builder
      .update('staff')
      .set('name', json_data['name'])
      .where('id = ?')
      .get_query

    # @db.execute(query)

  end

end
