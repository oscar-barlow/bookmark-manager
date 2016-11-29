require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './app/models/link'

class BookmarkManager < Sinatra::Base

  configure :test do
    DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  configure :development do
    DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_development')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end
  
  get '/' do
    'Saved Links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :add_link
  end

  post '/links' do
    @title = params[:Title]
    @url = params[:URL]
    Link.create(url: @url, title: @title)
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
