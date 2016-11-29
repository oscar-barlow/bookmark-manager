require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './app/models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Saved Links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
