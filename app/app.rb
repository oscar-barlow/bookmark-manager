ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative './models/modules.rb'
require_relative './models/user'
require 'pry'
include DatamapperSetup
dm_setup


class BookmarksManager < Sinatra::Base

  # before do
  #   def current_user
  #     @current_user ||= User.get(session[:user_id])
  #   end
  # end


  enable :sessions
  set :session_secret, 'super secret'

  post '/users' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end


  get '/links/new' do
    erb :'links/new'
  end

  post '/links/create' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:name].split(', ').each do |tag|
      link.tags << Tag.create(name: tag)
    end

    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'/links/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  #
  # # start the server if ruby file executed directly
  run! if app_file == $0
end
